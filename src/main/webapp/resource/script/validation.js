function firstNameValidation() {
    var fName = document.getElementById("fName").value;
    var submitBtn = document.getElementById("Submitbutton");
    if (fName.length < 3) {
        document.getElementById("fMsg").innerText = "Enter valid first name";
        submitBtn.disabled=true;
    } else {
        document.getElementById("fMsg").innerText = "";
         submitBtn.disabled=false;
    }
    console.log(fName);
}

function lastNameValidation(){
  var lName = document.getElementById("lName").value;
  var submitBtn = document.getElementById("Submitbutton");
  if(lName.length < 3){
        document.getElementById("lMsg").innerText = "Enter valid last name";
        submitBtn.disabled = true;
    }else{
       document.getElementById("lMsg").innerText = "";
       submitBtn.disabled = false;
     }
     console.log(lName);
}

async function emailValidation() {
    var em = document.getElementById("email").value;
    var submitBtn = document.getElementById("Submitbutton");
    var emailMsg = document.getElementById("emailMsg");
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    const a = await axios("http://localhost:8080/apple-showroom/doesEmailExist?email"+em);
    console.log(a.date);

    if (!emailPattern.test(em)) {
        emailMsg.innerText = "Enter a valid email";
        submitBtn.disabled = true;
    } else {
        emailMsg.innerText = "";
        submitBtn.disabled = false;
    }
}

function phoneValidation() {
    var ph = document.getElementById("phone").value;
    var submitBtn = document.getElementById("Submitbutton");
    var phoneNumber = document.getElementById("phNo"); 
    var phonePattern = /^[0-9]{10}$/;
    if (!phonePattern.test(ph)) {
        phoneNumber.innerText = "Enter a valid 10-digit phone number";
        submitBtn.disabled = true;
    } else {
        phoneNumber.innerText = "";
        submitBtn.disabled = false;
    }
    console.log(ph);
}

function dobValidation() {
    var dob = document.getElementById("dob").value;
    var submitBtn = document.getElementById("Submitbutton");
    var dobMsg = document.getElementById("dobMsg");
    if (!dob) {
        dobMsg.innerText = "Please enter your date of birth";
        submitBtn.disabled = true;
        return;
    }
    var dobDate = new Date(dob);
    var today = new Date();
    if (dobDate > today) {
        dobMsg.innerText = "DOB cannot be in the future";
        submitBtn.disabled = true;
        return;
    }
    var age = today.getFullYear() - dobDate.getFullYear();
    var monthDiff = today.getMonth() - dobDate.getMonth();
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dobDate.getDate())) {
        age--;
    }
    if (age < 18) {
        dobMsg.innerText = "You must be at least 18 years old";
        submitBtn.disabled = true;
    } else {
        dobMsg.innerText = "";
        submitBtn.disabled = false;
    }
    console.log("DOB:", dob, "Age:", age);
}

function genderValidation() {
    var genders = document.getElementsByName("gender"); 
    var submitBtn = document.getElementById("Submitbutton");
    var genderMsg = document.getElementById("genderMsg"); 
    var selected = false;
    for (var i = 0; i < genders.length; i++) {
        if (genders[i].checked) {
            selected = true;
            break;
        }
    }
    if (!selected) {
        genderMsg.innerText = "Please select gender";
        submitBtn.disabled = true;
    } else {
        genderMsg.innerText = "";
        submitBtn.disabled = false;
    }
}

function countryValidation() {
    var country = document.getElementById("country").value;
    var msg = document.getElementById("countryMsg");
    var btn = document.getElementById("Submitbutton");

    if (country.length < 3) {
        msg.innerText = "Enter your country";
        btn.disabled = true;
    } else {
        msg.innerText = "";
        btn.disabled = false;
    }
}

function stateValidation() {
    var state = document.getElementById("state").value;
    var msg = document.getElementById("stateMsg");
    var btn = document.getElementById("Submitbutton");

    if (state.length < 3) {
        msg.innerText = "Enter your state";
        btn.disabled = true;
    } else {
        msg.innerText = "";
        btn.disabled = false;
    }
}

function cityValidation() {
    var city = document.getElementById("city").value.trim();
    var msg = document.getElementById("cityMsg");
    var btn = document.getElementById("Submitbutton");

    if (city.length < 3) {
        msg.innerText = "Enter valid city name";
        btn.disabled = true;
    } else {
        msg.innerText = "";
        btn.disabled = false;
    }
}

function pincodeValidation() {
    var pin = document.getElementById("pincode").value;
    var msg = document.getElementById("pincodeMsg");
    var btn = document.getElementById("Submitbutton");

    var pinPattern = /^[0-9]{6}$/;

    if (!pinPattern.test(pin)) {
        msg.innerText = "Enter valid 6-digit pincode";
        btn.disabled = true;
    } else {
        msg.innerText = "";
        btn.disabled = false;
    }
}

function passwordValidation() {
    var pass = document.getElementById("password").value;
    var submitBtn = document.getElementById("Submitbutton");
    var msg = document.getElementById("passwordMsg");
    var btn = document.getElementById("Submitbutton");

    if (pass.length < 6) {
        msg.innerText = "Password must be at least 6 characters";
        btn.disabled = true;
    } else {
        msg.innerText = "";
        btn.disabled = false;
    }
}

function confirmPasswordValidation() {
    var pass = document.getElementById("password").value;
    var confirmPass = document.getElementById("confirmPassword").value;
    var msg = document.getElementById("confirmPasswordMsg");
    var btn = document.getElementById("Submitbutton");

    if (confirmPass !== pass || confirmPass === "") {
        msg.innerText = "Passwords do not match";
        btn.disabled = true;
    } else {
        msg.innerText = "";
        btn.disabled = false;
    }
}




