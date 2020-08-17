<script language='javascript' runat=server>
    Platform.Load("core","1");
    var payload = '';
    var endpoint = "https://mcjss9736km3nd134n6cv8-hcfy0.soap.marketingcloudapis.com/Service.asmx";
    //Automation Customer Key
    var objectID = 'a82772d3-4dd5-4efb-8736-b1263f010bc5';
    var result;
    //Create a DE for logging if logging is needed.
    //var logDE = DataExtension.Init("Triggered_Automation_Log");

    var setup = {
      authBaseURI: "https://mcjss9736km3nd134n6cv8-hcfy0.auth.marketingcloudapis.com/",
      restBaseURI: "https://mcjss9736km3nd134n6cv8-hcfy0.rest.marketingcloudapis.com/",
      clientId: "gn76gwjiuztewe5wi1zpz85v",
      clientSecret: "UeRqj3Le7QEnEqtir0DvKF59"
    }
    var token = getToken(setup);

    function getToken(setup) {

      var config = {
          url : setup.authBaseURI + "v2/token",
          contentType : "application/json",
          payload : {
              "client_id": setup.clientId,
              "client_secret": setup.clientSecret,
              "grant_type": "client_credentials"
          }
      }

      var req = HTTP.Post(config.url, config.contentType, Stringify(config.payload));

      if (req.StatusCode == 200) {
          var res = Platform.Function.ParseJSON(req.Response[0]);
          return res.access_token;
      } else {
          return false;
      }

    }

    startAutomation();

function startAutomation() {
        payload += '<?xml version="1.0" encoding="utf-8"?>';
        payload += '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">';
        payload += '   <soapenv:Header>';
        payload += '   <fueloauth>' + token + '</fueloauth>';
        payload += '   </soapenv:Header>';
        payload += '   <soapenv:Body>';
        payload += '        <PerformRequestMsg xmlns="http://exacttarget.com/wsdl/partnerAPI">';
        payload += '            <Action>start</Action>';
        payload += '            <Definitions>';
        payload += '                    <Definition xsi:type="Automation">';
        payload += '                    <Client>';
        payload += '                        <ID>110007689</ID>';
        payload += '                    </Client>';
        payload += '                        <ObjectID>' + objectID + '</ObjectID>';
        payload += '                    </Definition>';
        payload += '            </Definitions>';
        payload += '        </PerformRequestMsg>';
        payload += '   </soapenv:Body>';
        payload += '</soapenv:Envelope>';

        try {
                result = HTTP.Post(endpoint,"text/xml",payload,['SOAPAction'],['Perform']);
        } catch(e) {
                // logDE.Rows.Add({Status:500,Message:Stringify(e)});
        }

        if (result.StatusCode != 200) {
            //Bad response
            // logDE.Rows.Add({Status:result.StatusCode,Message:Stringify(result)});
        } else {
            //Good response
                var status = Stringify(result.Response[0]).match(/<OverallStatus>([^<]*)<\/OverallStatus>/)[1];
                var requestId = Stringify(result.Response[0]).match(/<RequestID>([^<]*)<\/RequestID>/)[1];

                // logDE.Rows.Add({Status:status,RequestId:requestId});
        }
}
</script>