function showBill(number) {
  if (window.XMLHttpRequest) {
      xmlhttp = new XMLHttpRequest();
  } else {
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          document.getElementById("show-bill").innerHTML = this.responseText;
      }
  };
  xmlhttp.open("POST", "assets/php/billcount.php", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("counter=" + number);
}

function showBooking() {
  if (window.XMLHttpRequest) {
      xmlhttp = new XMLHttpRequest();
  } else {
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          document.getElementById("show-booking").innerHTML = this.responseText;
      }
  };
  xmlhttp.open("POST", "assets/php/bookingcount.php", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send();
}

function payBill(value) {
  if (window.XMLHttpRequest) {
      xmlhttp = new XMLHttpRequest();
  } else {
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          document.getElementById("payout-confirmed").innerHTML = this.responseText;
          var CounterBill = document.getElementById("historical-count").value;
          showBill(CounterBill);
      }
  };
  xmlhttp.open("POST", "assets/php/paybill.php", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("data=" + value);
}

function deleteBooking(value) {
  if (window.XMLHttpRequest) {
      xmlhttp = new XMLHttpRequest();
  } else {
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          document.getElementById("delete-booking-confirmed").innerHTML = this.responseText;
          showBooking();
      }
  };
  xmlhttp.open("POST", "assets/php/deletebooking.php", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("data=" + value);
}

function paySubscription(value) {
  if (window.XMLHttpRequest) {
      xmlhttp = new XMLHttpRequest();
  } else {
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          document.getElementById("new-subscription-confirmed").innerHTML = this.responseText;
          showSubscription();
          var CounterBill = document.getElementById("historical-count").value;
          showBill(CounterBill);
          updateProfilView();
      }
  };
  xmlhttp.open("POST", "assets/php/newsubscription.php", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("data=" + value);
}

function showSubscription() {
  if (window.XMLHttpRequest) {
      xmlhttp = new XMLHttpRequest();
  } else {
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          document.getElementById("show-subscription").innerHTML = this.responseText;
      }
  };
  xmlhttp.open("POST", "assets/php/showsubscription.php", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send();
}

function updateProfilView() {
  if (window.XMLHttpRequest) {
      xmlhttp = new XMLHttpRequest();
  } else {
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          document.getElementById("show-profil").innerHTML = this.responseText;
      }
  };
  xmlhttp.open("POST", "assets/php/profilview.php", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send();
}
