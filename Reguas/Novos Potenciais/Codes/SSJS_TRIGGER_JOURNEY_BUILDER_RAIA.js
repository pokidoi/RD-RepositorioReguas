<script runat="server">

    Platform.Load("Core", "1.1.1");

    var DE_POTENCIAIS = DataExtension.Init("DE_POTENCIAIS_RAIA_TESTE");
    var data = testDE.Rows.Lookup(["FLAG_PRECO"], [1]);
    for (let index = 0; index < array.length; index++) {
      const element = array[index];
      
    }
    var data = {
        SubscriberKey: "26",
        EMAIL: "pedro.okidoi@gentrop.com",
        ID_CLIENTE: "26",
        TEL_CELULAR: "5511963847374",
        NOME: "PEDRO",
        VALOR_TOTAL_NF: "150.00"
    }

    var setup = {
		authBaseURI: "https://mcjss9736km3nd134n6cv8-hcfy0.auth.marketingcloudapis.com/",
		restBaseURI: "https://mcjss9736km3nd134n6cv8-hcfy0.rest.marketingcloudapis.com/",
		clientId: "c3s0fgoa6fe1gl09hdyiyq48",
		clientSecret: "wM91Dq1rrNZkPknhGzQRaJG0",
		eventDefinitionKey: "APIEvent-1ac25235-b823-8b2c-73e1-9a0e57f09bcc"
	}

    try {
        var token = getToken(setup);
        var success = false;
        if (!!token) success = triggerEvent(token, setup, data); 
        if (!!success){
          Write("Subscriber was successfully injected into the Journey"); 
        } 
        else{
          Write("Failed to inject subscriber into the Journey");
        } 
    } catch (err) {
        Write("Error: " + Stringify(err));
    }

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

    function triggerEvent(token, setup, data) {

        var config = {
            url : setup.restBaseURI + "interaction/v1/events",
            contentType : "application/json",
            headerName : ["Authorization"],
            headerValue : ["Bearer " + token],
            payload : {
                ContactKey: data.SubscriberKey,
                EventDefinitionKey: setup.eventDefinitionKey,
                Data: data
            }
        }

        var req = HTTP.Post(config.url, config.contentType, Stringify(config.payload), config.headerName, config.headerValue);

        if (req.StatusCode == 201) {
            var res = Platform.Function.ParseJSON(req["Response"][0]);
            if (res.eventInstanceId != null && res.eventInstanceId != "") return true;
        } else {
            return false;
        }
        
    }

</script>