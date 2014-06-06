<%@ Control Language="vb" AutoEventWireup="false" Inherits="r2i.OWS.Wrapper.DNN.Module" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Assembly="r2i.OWS.Wrapper.DotNetNuke" Namespace="r2i.OWS.Wrapper.DNN" TagPrefix="cc1" %>

<cc1:OpenControl id="ows" resourcekey="Module.Text" runat="server"></cc1:OpenControl>

<link rel="stylesheet" type="text/css" href="/DesktopModules/RSE/RSEHtmlModule/RSEHtmlModule.css" />

<script runat="server">
	
</script>

<script type="text/javascript">
/*
 * @author Bryan Beswick
 * 
 * This is a non-intrusive add-on for OWS.  It allows the "queueing" of OWS.Fetch calls - multiple Fetch
 * calls can be made back-to-back and each will be executed one at a time.
 */

(function(){
    // remember the original OWS methods
    var orig_Fetch = ows.Fetch,
        orig_FetchEnd = ows.FetchEnd,
        callbackFunction = false
        ;

    // define new methods to wrap around the standard OWS ones
    function new_Fetch(TM, page, appendQuery, targetobjectid, async){
        callbackFunction = (typeof async == 'function') ? async : false;    // remember the callback (if any)
        orig_Fetch.call(ows, TM, page, appendQuery, targetobjectid);        // call the standard method
    }
    function new_FetchEnd(TM, targetobjectid, ignoreResultStats){
        // ignore transitionary state changes - wait for 4 (done)
        if(ows.items['o'+TM].xml && ows.items['o'+TM].xml.readyState == 4) {
            var cb = callbackFunction;      // remember callback and clear it so that recusion works best
            callbackFunction = false;
            var response = this.items['o'+TM].xml.status;   // 200 = OK
            
            orig_FetchEnd.call(ows, TM, targetobjectid, ignoreResultStats);     // call the standard function
            if(cb) cb(response);        // run the callback if it was specified in the Fetch
        }
    }
    
    // augment the standard OWS functions
    ows.Fetch = new_Fetch;
    ows.FetchEnd = new_FetchEnd;
})();
</script>
<script src="/DesktopModules/RSE/RSEHtmlModule/js/RSEHtmlModule.js"></script>
