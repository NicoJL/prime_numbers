
App.notification = App.cable.subscriptions.create("NumberChannel",{
		connected: function(){

		},
		disconnected: function(){

		},
		received: function(data){
			console.log(data.item);
			console.log(data.is_prime);
			app.isPrime = eval(data.is_prime);
			app.auxNumber = data.item;
			app.calculatePrime(data.item);
		}
	});