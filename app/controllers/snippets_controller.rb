class SnippetsController < ApplicationController
	def index
		@search_by_title = Snippet.search(params[:q])
		@search_by_tags = Tag.search(params[:q])
		@snippets = []

		@results_by_title = @search_by_title.result(distinct: true)
		@results_by_tags = @search_by_tags.result(distinct: true)

		# With an increasing database, consider pagination offset by 25
		
		if @results_by_title || @results_by_tags
			@results_by_title.order("snip_count DESC").each{ |snippet| @snippets << snippet }
			@results_by_tags.each do |tag|
				tag.snippets.order("snip_count DESC").each do |snippet| @snippets << snippet
				end
			end
			@snippets.uniq!
		else
			case params[:languages]
				when "None"
					case params[:filter]
						when "Snip Count"
							@snippets = Snippet.all.order(snip_count: :desc)
						when "Most Recent"
							@snippets = Snippet.all.order(created_at: :desc)
						when "Oldest"
							@snippets = Snippet.all.order(created_at: :asc)
						when "Random 5"
							5.times { @snippets << Snippet.all.sample }		
					end
				when "Ruby"
					case params[:filter]
						when "Snip Count"
							@snippets = Snippet.where(language: "ruby").order(snip_count: :desc)
						when "Most Recent"
							@snippets = Snippet.where(language: "ruby").order(created_at: :desc)
						when "Oldest"
							@snippets = Snippet.where(language: "ruby").order(created_at: :asc)
						when "Random 5"
							5.times { @snippets << Snippet.where(language: "ruby").sample }	
					end		
				when "Javascript"
					case params[:filter]
						when "Snip Count"
							@snippets = Snippet.where(language: "javascript").order(snip_count: :desc)
						when "Most Recent"
							@snippets = Snippet.where(language: "javascript").order(created_at: :desc)
						when "Oldest"
							@snippets = Snippet.where(language: "javascript").order(created_at: :asc)
						when "Random 5"
							5.times { @snippets << Snippet.where(language: "javascript").sample }	
					end	
				when "HTML"
					case params[:filter]
						when "Snip Count"
							@snippets = Snippet.where(language: "html").order(snip_count: :desc)
						when "Most Recent"
							@snippets = Snippet.where(language: "html").order(created_at: :desc)
						when "Oldest"
							@snippets = Snippet.where(language: "html").order(created_at: :asc)
						when "Random 5"
							5.times { @snippets << Snippet.where(language: "html").sample }	
						end
				when "CSS"
					case params[:filter]
						when "Snip Count"
							@snippets = Snippet.where(language: "css").order(snip_count: :desc)
						when "Most Recent"
							@snippets = Snippet.where(language: "css").order(created_at: :desc)
						when "Oldest"
							@snippets = Snippet.where(language: "css").order(created_at: :asc)
						when "Random 5"
							5.times { @snippets << Snippet.where(language: "css").sample }	
					end
				else
				@snippets = Snippet.all.order(snip_count: :desc).limit(25)
			end
		end
	    @snippet = Snippet.new
	end

	def show
		@search_by_title = Snippet.search(params[:q])
		@snippet = Snippet.find(params[:id])
		@snippet
	end

	def describe
		@search_by_title = Snippet.search(params[:q])
		@snippet = Snippet.find(params[:id])
	end

	def new
		if session[:user_id]
			@search_by_title = Snippet.search(params[:q])
			@snippet = Snippet.new
		else
			redirect_to users_login_path
		end
	end

	def create
		@user = User.find(session[:user_id])
		@snippet = @user.snippets.create(snippet_params)
		if @snippet.save
			tag_list = Tag.create_tags(params[:tag_list])
		  	tag_list.each do |tag_id|
		    	@snippet.snippet_tags.create(tag_id: tag_id)
		  	end
			redirect_to snippets_path
		else
			redirect_to snippets_path
		end
	end

	def edit
		@search_by_title = Snippet.search(params[:q])
		@snippet = Snippet.find(params[:id])
	end

	def update
		@snippet = Snippet.find(params[:id])
		@snippet.update(snippet_params)
		if @snippet.save
			tag_list = Tag.create_tags(params[:tag_list])
			p tag_list
		  tag_list.each do |tag_id|
		    @snippet.snippet_tags.create(tag_id: tag_id)
		  end
			redirect_to snippet_path(@snippet)
		else
			redirect_to edit_snippet_path(@snippet)
		end
	end

	def destroy
		@snippet = Snippet.find(params[:id])
		@snippet.destroy
		redirect_to root_path
	end

	private
	def snippet_params
		params.require(:snippet).permit(:title, :code, :language)
	end
end
