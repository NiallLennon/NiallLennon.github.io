<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="BusinessService.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

         
  
<form action="/charge" method="POST">
  <script
    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
    data-key="pk_test_rn90VJMG1Sr4KPDx9Y5oT4KJ"
    data-amount="2000"
    data-name="Demo Site"
    data-description="2 widgets"
    data-image="/img/documentation/checkout/marketplace.png"
    data-locale="auto"
    data-zip-code="true"
    data-currency="eur">
  </script>
</form>

          
</body>
</html>
