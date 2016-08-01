using System;
using System.Web;
using Microsoft.AspNet.SignalR;
namespace BusinessService
{
    public class ChatHub : Hub
    {
        public void Send(string username, string message)
        {
            // Call the broadcastMessage method to update clients.
            Clients.All.broadcastMessage(username, message);
        }
    }
}