#moDnnArticle

- [Project homepage](http://www.mattopen.com/Projekte/moTimeline)
- [Installation](#installation)
- [Requirements](#dependencies)
- [Demo sites](#demo)
- [License(MIT)](#license)

##Description
moDnnArticle is a DNN - EVOQ html multi-language module with content localization, based on Open Web Studio and DotNetNuke 7 - MIT licensed.
We use bootstrap for some reason and for my opinion, bootstrap is the best framework, so it will be necessary to implement bootstrap JS and CSS within your skin.

##Installation
<p>install moDnnArticle as you usually install modules to your DNN site</p>
Add the following HTML snippet to the head section of your webpage and copy the bootstrap folder to your skin:
```html
<link rel="stylesheet" type="text/css" href="<%= PortalSettings.HomeDirectory %>bootstrap/css/bootstrap.min.css" />
```

<p>Include the following scripts at the bottom of your skin</p>
<p>!!!	check before if bootstrap.js exist and do not load twice	!!!</p>
```html
<script src="<%= PortalSettings.HomeDirectory %>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
```

<p>install ckeditor for dnn</p>
[CKEditor](https://dnnckeditor.codeplex.com/wikipage?title=Installation&referringTitle=Documentation)

take a look at example skin how to use.

##Configuration CK-Editor
<p>CKEditor settings can also be configured by using the ckeditor_config.js file. To change CKEditor configuration, add the settings that you want to modify to the ckeditor_config.js, find here:</p>
```html
/DesktopModules/MattOpen/moDnnArticle/js/ckeditor_config.js
```
for more information look at [CK-EDITOR.config](http://docs.ckeditor.com/#!/api/CKEDITOR.config-cfg-customConfig)


##updates and version
###version 1.2.5
* change button, logic and functionality
* prevent load css twice
* prevent load js twice
* change some css

###version 1.2.1
* SEO enhancement:
* Content will be rendered without javascript enabled. Now google results will be better

###version 1.2.0
remove these link`s from your skin if you use an older version of moDnnArticle. Since Version 1.2.0 the moDnnArticle.css and the moDnnArticle.js will be load automatically.
```html
<link rel="stylesheet" type="text/css" href="/DesktopModules/MattOpen/moDnnArticle/moDnnArticle.css" />
<script src="/DesktopModules/MattOpen/moDnnArticle/js/moDnnArticle.js" type="text/javascript"></script>
```

###version 1.1.06
* some bugfix
* some changes in css and styling

###version 1.1.03
* enhance systemmessages
* add path to ckeditor_config.js - customize ck-editor to your needs.

###version 1.1.02
* minor bugfix
* rename the module from RSEHtmlModule to moDnnArticle 

###version 1.0.13 
* add new procedure RSEQueryFocusID. Edit item was not possible. 
* syntax error in script update headline 
* check sql version and add script 
* update copy ModuleName script 
* add class moHtmlModule to outer div 
* check if div headline exist before add new headlinetext (module crash if not exist)

###version 1.0.11
* can´t edit new item - close


##Dependencies
* [DNN](http://www.dnnsoftware.com/) evoq content (formerly DotNetNUke)
* [OWS](http://www.openwebstudio.com/) build with OpenWebStudio for DNN
* [CKEditor](https://dnnckeditor.codeplex.com/)
* [jQuery](https://jquery.com/) v. 1.9.0+
* [Bootstrap](http://getbootstrap.com/) v. 3.0.0+
* requires jquery-ui 1.8.16 or higher


##Demo
Example websites, build with 
* http://www.mattopen.com
* http://www.duritcast.de
* http://www.duritsteel.de

##License
Released under the [MIT license](http://www.opensource.org/licenses/MIT).
This plugin and all code contained is Copyright 2015 <a href="http://www.exponde.com" >exponde</a>, Germany. You are granted a license to use this code / software as you wish, free of charge and free of restrictions under the MIT license

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

This project is updated and maintained by:
MattOpen http://www.mattopen.com
