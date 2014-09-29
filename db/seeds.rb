# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "codebytes-demo@email.com", password: "testing123")
Cheatsheet.create(name: "New Cheatsheet", user_id: 1)
Tag.create(title: "html5")
Tag.create(title: "media")
Tag.create(title: "web responsiveness")
Tag.create(title: "font")
Tag.create(title: "form")
Tag.create(title: "autocomplete")
Snippet.create(title: "HTML 5: Video", language: "html", snip_count: 0, user_id: 1, code: "<video width=\"400\" controls>\r\n  <source src=\"mov_bbb.mp4\" type=\"video/mp4\">\r\n  <source src=\"mov_bbb.ogg\" type=\"video/ogg\">\r\n  Your browser does not support HTML5 video.\r\n</video>", description: "Video support! YES! HTML5 supports video handling. This code provides the generic structure to render videos. HTML5 also provides Audio/Video DOM interaction.\r\n\r\nHTML5 Video Support Reference:\r\nhttp://www.w3schools.com/html/html5_video.asp\r\nHTML5 Audio/Video Reference: http://www.w3schools.com/tags/ref_av_dom.asp")
SnippetTag.create(snippet_id: 1, tag_id: 1)
SnippetTag.create(snippet_id: 1, tag_id: 2)
Snippet.create(title: "Styling: @media screen", language: "css", snip_count: 0, user_id: 1, code: "/* Smartphones (portrait and landscape) ----------- */\r\n@media only screen \r\nand (min-device-width : 320px) \r\nand (max-device-width : 480px) {\r\n/* Styles */\r\n}\r\n\r\n/* Smartphones (landscape) ----------- */\r\n@media only screen \r\nand (min-width : 321px) {\r\n/* Styles */\r\n}\r\n\r\n/* Smartphones (portrait) ----------- */\r\n@media only screen \r\nand (max-width : 320px) {\r\n/* Styles */\r\n}\r\n\r\n/* iPads (portrait and landscape) ----------- */\r\n@media only screen \r\nand (min-device-width : 768px) \r\nand (max-device-width : 1024px) {\r\n/* Styles */\r\n}\r\n\r\n/* iPads (landscape) ----------- */\r\n@media only screen \r\nand (min-device-width : 768px) \r\nand (max-device-width : 1024px) \r\nand (orientation : landscape) {\r\n/* Styles */\r\n}\r\n\r\n/* iPads (portrait) ----------- */\r\n@media only screen \r\nand (min-device-width : 768px) \r\nand (max-device-width : 1024px) \r\nand (orientation : portrait) {\r\n/* Styles */\r\n}\r\n\r\n/* Desktops and laptops ----------- */\r\n@media only screen \r\nand (min-width : 1224px) {\r\n/* Styles */\r\n}\r\n\r\n/* Large screens ----------- */\r\n@media only screen \r\nand (min-width : 1824px) {\r\n/* Styles */\r\n}\r\n\r\n/* iPhone 4 ----------- */\r\n@media\r\nonly screen and (-webkit-min-device-pixel-ratio : 1.5),\r\nonly screen and (min-device-pixel-ratio : 1.5) {\r\n/* Styles */\r\n}", description: "CSS provides media type handling to create a consistent user experience across multiple media types. Media screen queries allow web responsive support to varying broswers, screens, and window sizes. This code was sourced from treehouse.\r\n\r\nCSS Media Types Reference:\r\nhttp://www.w3schools.com/css/css_mediatypes.asp")
SnippetTag.create(snippet_id: 2, tag_id: 3)
Snippet.create(title: "HTML 5: Datalist - Form Option", language: "html", snip_count: 0, user_id: 1, code: "<form action=\"demo_form.asp\" method=\"get\">\r\n  <input list=\"browsers\">\r\n  <datalist id=\"browsers\">\r\n    <option value=\"Internet Explorer\">\r\n    <option value=\"Firefox\">\r\n    <option value=\"Chrome\">\r\n    <option value=\"Opera\">\r\n    <option value=\"Safari\">\r\n  </datalist> \r\n</form>", description: "For HTML5 form support. Datalist is a form option that allows for developers to set a pre-determined list of options as inputs. Each input in this list is given autocomplete functionality upon input as well as user-custom inputs.\r\n\r\nCheck out w3schools live demo:\r\nhttp://www.w3schools.com/tags/tryit.asp?filename=tryhtml5_datalist")
SnippetTag.create(snippet_id: 3, tag_id: 1)
SnippetTag.create(snippet_id: 3, tag_id: 5)
SnippetTag.create(snippet_id: 3, tag_id: 6)
Snippet.create(title: "Styling: @font-face", language: "css", snip_count: 0, user_id: 1, code: "h2 {\r\n  font-family: 'MyWebFont';\r\n}\r\n\r\n@font-face {\r\n  font-family: 'MyWebFont';\r\n  src: url('webfont.eot'); /* IE9 Compat Modes */\r\n  src: url('webfont.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */\r\n       url('webfont.woff') format('woff'), /* Modern Browsers */\r\n       url('webfont.ttf')  format('truetype'), /* Safari, Android, iOS */\r\n       url('webfont.svg#svgFontName') format('svg'); /* Legacy iOS */\r\n}", description: "CSS customized font support for those who care about the ridges and valleys of font(typography - not topography). Pick out an external font that is not supported by HTML web safe fonts. Download it. Store it somewhere within your project directory. Source it and use this code to render it.")
SnippetTag.create(snippet_id: 4, tag_id: 4)


