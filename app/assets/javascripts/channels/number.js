
App.notification = App.cable.subscriptions.create("NumberChannel",{
		connected: function(){

		},
		disconnected: function(){

		},
		received: function(data){
			console.log(data.item);
		}
	});