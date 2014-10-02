#Multi language html content module for dnn  (stable)
RSEHtmlModuleDNN is a DNN html module with content localization, based on Open Web Studio and DotNetNuke 7 - MIT licensed.

##Features


##Installation
<p>install RSEHtmlModuleDNN as you usually install modules to your DNN site</p>
<p>add the bootstrap and RSEHtmlModule css-files to the head of your site</p>
<pre>
<code>
 &#x3C;link rel=&#x22;stylesheet&#x22; type=&#x22;text/css&#x22; href=&#x22;&#x3C;%= PortalSettings.HomeDirectory %&#x3E;bootstrap/css/bootstrap.min.css&#x22; /&#x3E;
 &#x3C;link rel=&#x22;stylesheet&#x22; type=&#x22;text/css&#x22; href=&#x22;/DesktopModules/RSE/RSEHtmlModule/RSEHtmlModule.css&#x22; /&#x3E;
</code>
</pre>

<p>add the bootstrap and RSEHtmlModule js-files to the bottom of your site</p>
<pre>
<code>
 &#x3C;script src=&#x22;&#x3C;%= PortalSettings.HomeDirectory %&#x3E;bootstrap/js/bootstrap.min.js&#x22; type=&#x22;text/javascript&#x22;&#x3E;&#x3C;/script&#x3E;
 &#x3C;script src=&#x22;/DesktopModules/RSE/RSEHtmlModule/js/RSEHtmlModule.js&#x22; type=&#x22;text/javascript&#x22;&#x3E;&#x3C;/script&#x3E;
</code>
</pre>



<p>install ckeditor for dnn</p>
<pre>
<code>
 https://dnnckeditor.codeplex.com/wikipage?title=Installation&referringTitle=Documentation
</code>
</pre>
take a look at example skin, how to use.

##updates and version
###v 1.0.11
* can´t edit new item - open


##Dependencies
* DNN evoq content (formerly DotNetNUke) http://www.dnnsoftware.com/
* build with OpenWebStudio (ows) for DNN http://www.openwebstudio.com/
* Bootstrap 3.x http://getbootstrap.com/
* CKEditor https://dnnckeditor.codeplex.com/
* require jQuery, 1.9 or higher
* requires jquery-ui 1.8.16 or higher


##Example websites, build with 
* http://www.duritcast.de
* http://www.duritsteel.de

#License
This plugin and all code contained is Copyright 2014 <a href="http://www.exponde.com" >exponde</a>, Germany. You are granted a license to use this code / software as you wish, free of charge and free of restrictions under the MIT license

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

This project is updated and maintained by:
MattOpen http://www.mattopen.com
