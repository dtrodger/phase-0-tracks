var colors = ["red", "blue", "green", "white"];
var names = ["Ed", "Tom", "Bill", "Sarah"];

colors.push("brown")
names.push("Jill")

var horses = {}
for (var horse_created = 0; horse_created < names.length; horse_created++) {
	horses[names[horse_created]] = colors[horse_created]
}

function Car(make, model, color, year, topspeed) {
	this.make = make;
	this.model = model;
	this.color = color;
	this.year = year;
	this.topspeed = topspeed;

	this.info = function() {
		console.log(["\nThis car is a ", this.color, " ", this.make," ",this.model," made in ", this.year,". Its top speed is ",this.topspeed,"."].join(""));
	};

	console.log("\nCAR INITIALIZATION COMPLETE");
}

var ford = new Car("Ford", "Focus", "Blue", 2002, 120);
var audi = new Car("Audi", "A8", "Black", 2010, 160);
var nissan = new Car("Nissan", "Sentra", "Green", 2012, 130);

ford.info()
audi.info()
nissan.info()
