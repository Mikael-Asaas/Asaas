<html>
<head>
    <meta name="layout" content="main"/>
    <title>Enviar notificação por Email</title>
<body>
    <div id="content" role="main">
        <section class="row colset-2-its">
            <g:if test="${flash.message}">
                <div class="message" role="alert">
                    ${flash.message}
                </div>
            </g:if>
            <h2>Envio de E-mail</h2>
            <g:form controller="emailSender" action="send">
                <div class="fieldcontain">
                  <g:textField name="address" placeholder="seu-email@something.com" required="" />
                </div>
                <div class="fieldcontain">
                  <g:textField name="subject" placeholder="Seu destinatário" required="" />
                </div>
                <div class="fieldcontain">
                  <g:textArea name="body" rows="5" cols="80" placeholder="Descrição" required="" />
                </div>
                <fieldset>
                  <g:submitButton name="send" value="enviar" />
                </fieldset>
            </g:form>
        </section>
    </div>
</body>
</html>