<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BusinessService.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--<h2><%: Title %>.</h2>-->
    <h3>&nbsp;</h3>
<h3>Collaboration Area</h3>

    <h2>Please use this area to discuss what you would like to get from the service.
        Feel free to talk to other customers about their experiences and what 
        they found beneficial.

        <br />
        <br />
        Since this is a public forum please keep your comments general
        and do not discuss business sensitive details. 
        <br />
        <br />
        For example, users often ask questions like
        what details are required to forecast profitability
        of a discounted product over a 5 year period. 
        <br />
    </h2>

    <br />
    <br />


        <div class="container">
        <input type="text" id="message" />
        <input type="button" id="sendmessage" value="Send" />
        <input type="hidden" id="displayusername" />
        <ul id="discussion">
        </ul>
    </div>
    <!--Script references. -->
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/jquery.signalR-2.1.2.min.js"></script>
    <script src="Scripts/jquery.signalR-2.1.2.js"></script>
    <script src="signalr/hubs"></script>
    <script type="text/javascript">
        $(function () {
            // Declare a proxy to reference the hub. 
            var chat = $.connection.chatHub;
            // Create a function that the hub can call to broadcast messages.
            chat.client.broadcastMessage = function (username, message) {
                // Html encode display name and message. 
                var encodedName = $('<div />').text(username).html();
                var encodedMsg = $('<div />').text(message).html();
                // Add the message to the page. 
                $('#discussion').append('<li><strong>' + encodedName
                    + '</strong>:&nbsp;&nbsp;' + encodedMsg + '</li>');
            };
            // Get the user name and store it to prepend to messages.
            $('#displayusername').val(prompt('Enter your username:', ''));
            // Set initial focus to message input box.  
            $('#message').focus();
            // Start the connection.
            $.connection.hub.start().done(function () {
                $('#sendmessage').click(function () {
                    // Call the Send method on the hub. 
                    chat.server.send($('#displayusername').val(), $('#message').val());
                    // Clear text box and reset focus for next comment. 
                    $('#message').val('').focus();
                });
            });
        });
    </script>



    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
