/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var usernameValid = false;
var passwordValid = false;
var emailValid = false;

$(document).ready(function () {

    ///username gain focus
    $("#username1").focus(function () {
        $("#err div").remove();
    });

    ///username loose focus
    $("#username1").focusout(function () {
        var html = checkUsername($("#username1").val());
        $("#err").html(html);
    });

    ///university change
    $("#university").change(function () {
        var val = $(this).val();
        if (val === "dundee") {
            $("#school").html("<option vaue='N/A'>-</option><option value='art'>Art & Design (DJCAD)</option><option value='dentistry'>Dentistry</option><option value='education'>Education & Social Work</option><option value='humanities'>Humanities</option>\n\
                               <option value='lifeSciences'>Life Sciences</option><option value='medicine'>Medicine</option><option value='nursing'>Nursing & Midwifery</option><option value='scienceDundee'>Science & Engineering</option>\n\
                               <option value='socialSciences'>Social Sciences</option>");
            document.getElementById("matricSection").className = "form-group";
            document.getElementById("schoolSection").className = "form-group";
            document.getElementById("subjectSection").className = "form-group hidden";
        } else if (val === "abertay") {
            $("#school").html("<option vaue='N/A'>-</option><option value='artAbertay'>Arts, Media and Computer Games</option><option value='business'>Dundee Business School</option><option value='scienceAbertay'>Science, Engineering and Technology</option>\n\
                               <option value='socialHealth'>Social & Health Sciences</option>");
            document.getElementById("matricSection").className = "form-group hidden";
            document.getElementById("schoolSection").className = "form-group";
            document.getElementById("subjectSection").className = "form-group hidden";
        } else {
            $("#school").html("<option vaue='N/A'>-</option>");
            document.getElementById("matricSection").className = "form-group hidden";
            document.getElementById("schoolSection").className = "form-group hidden";
            document.getElementById("subjectSection").className = "form-group hidden";
        }
    });

    ///School change
    $("#school").change(function () {
        var val = $(this).val();
        if (val == "art") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Animation</option><option value=''>Art, Philosophy, APCP</option><option value=''>Digital Interaction Design</option><option value=''>Fine Art</option>\n\
                                <option value=''>General Foundation</option><option value=''>Graphic Design</option><option value=''>Illustration</option><option value=''>Interior Environmental Design</option>\n\
                                <option value=''>Jewellery & Metal Design</option><option value=''>Product Design</option><option value=''>Textile Design</option><option value=''>Time Based Art & Digital Film</option>\n\
                                <option value=''>MFA Art, Society & Publics</option><option value=''>MFA Art & Humanities</option><option value=''>MSc Animation & VFX</option><option value=''>MSc Forensic Art & Facial ID</option>\n\
                                <option value=''>MSc Medical Art</option><option value=''>MSc Product Design</option><option value=''>MLitt Theatre Studies</option><option value=''>PhD/MPhil</option><option value=''>Other/Not Listed</option>");
        } else if (val == "dentistry") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>BMSc (intercalated)</option><option value=''>Dental Surgery</option><option value=''>Oral Health Sciences</option><option value=''>MDSc Prosthodontics</option>\n\
                                <option value=''>MRes Oral Cancer</option><option value=''>MFOdont Forensic Odontology</option><option value=''>MSc Orthodontics (Egypt)</option><option value=''>MDPH Dental Public Health</option>\n\
                                <option value=''>MSc Oral Biology</option><option value=''>Other/Not Listed</option>");
        } else if (val == "education") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Childhood Practice/Childhood Studies</option><option value=''>Community Learning & Development</option><option value=''>Education (Primary)</option>\n\
                                <option value=''>Professional Development</option><option value=''>Professional Development (Leadership & Management)</option><option value=''>Professional Development (Tertiary Education)</option>\n\
                                <option value=''>Professional Development (Community Engagement)</option><option value=''>Professional Development (Volunteer Management)</option><option value=''>Social Work</option>\n\
                                <option value=''>Teaching Qualification Further Education</option><option value=''>PGCert Teaching Qualification Further Education</option><option value=''>PGCert Teaching in Higher Education</option>\n\
                                <option value=''>PGDE Education (Primary)</option><option value=''>PGDE Education (Secondary)</option><option value=''>PGDip Policing Studies</option>\n\
                                <option value=''>MPhil</option><option value=''>MRes</option><option value=''>MSc Community Learning & Development</option><option value=''>MSc Education</option><option value=''>MSc Educational Psychology</option>\n\
                                <option value=''>MSc Leadership and Innovation</option><option value=''>MSc Social Work</option><option value=''>PhD Education</option><option value=''>PhD Social Work</option><option value=''>PhD Community Learning & Development</option>\n\
                                <option value=''>D.CLD</option><option value=''>D.Ed</option><option value=''>D.SW</option><option value=''>D.Ed.Psy</option><option value=''>Other/Not Listed</option>");
        } else if (val == "humanities") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>American Studies</option><option value=''>English and Film Studies</option><option value=''>European Studies</option><option value=''>History</option><option value=''>Languages</option>\n\
                                <option value=''>Philosophy</option><option value=''>MFA Art & Humanities</option><option value=''>MLitt Comics Studies</option><option value=''>MLitt Film Studies</option><option value=''>MLitt Humanities</option>\n\
                                <option value=''>MLitt Theatre Studies</option><option value=''>MLitt Writing Practices & Study (Creative Writing)</option><option value=''>PhD English & Creative Writing</option>\n\
                                <option value=''>PhD History</option><option value=''>PhD Philosophy</option><option value=''>Other/Not Listed</option>");
        } else if (val == "lifeSciences") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Biochemistry</option><option value=''>Biological Chemistry & Drug Discovery</option><option value=''>Biological Sciences</option><option value=''>Biomedical Sciences</option>\n\
                                <option value=''>Foundation Year - Life Sciences</option><option value=''>Foundation Year - Life Sciences and English</option><option value=''>Life Sciences</option><option value=''>Microbiology</option>\n\
                                <option value=''>Molecular Biology</option><option value=''>Molecular Genetics</option><option value=''>Neuroscience</option><option value=''>Pharmacology</option><option value=''>Physiological Sciences</option>\n\
                                <option value=''>Other/Not Listed</option>");
        } else if (val == "medicine") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Medical Sciences</option><option value=''>Medicine</option><option value=''>Medicine (intercalated)</option><option value=''>PhD/Postgraduate</option><option value=''>Other/Not Listed</option>");
        } else if (val == "nursing") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Adult Nursing</option><option value=''>Child Nursing</option><option value=''>Mental Health Nursing</option><option value=''>Nursing</option><option value=''>Other/Not Listed</option>");
        } else if (val == "scienceDundee") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Anatomical Sciences</option><option value=''>Applied Computing</option>\n\
                                <option value=''>Civil Engineering</option><option value=''>Civil Engineering Design & Management</option><option value=''>Computing Science</option><option value=''>Electronic Engineering</option>\n\
                                <option value=''>Electronic Engineering & Physics</option><option value=''>Forensic Anthropology</option><option value=''>Foundation Year - Engineering/Physics/Maths/English</option><option value=''>Mathematical Biology</option>\n\
                                <option value=''>Mathematics</option><option value=''>Mathematics and Economics</option><option value=''>Mathematics and Financial Economics</option><option value=''>Mathematics and Physics</option>\n\
                                <option value=''>Mathematics and Psychology</option><option value=''>Mechanical Engineering</option><option value=''>Mechanical Engineering with Renewables</option><option value=''>Physics</option>\n\
                                <option value=''>Physics with Renewable Energy Science</option><option value=''>Renewables</option><option value=''>Other/Not Listed</option>");
        } else if (val == "socialSciences") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Accountancy</option><option value=''>Architecture</option><option value=''>Architecture Studies</option><option value=''>Architecture with Urban Planning</option>\n\
                                <option value=''>Business Economics</option><option value=''>Economics</option><option value=''>English Law</option><option value=''>Environmental Science</option><option value=''>Environmental Sustainability</option>\n\
                                <option value=''>European Politics</option><option value=''>Finance</option><option value=''>Financial Economics</option><option value=''>Foundation Year - Business and English</option><option value=''>Geography</option>\n\
                                <option value=''>Geopolitics</option><option value=''>International Business</option><option value=''>International Finance</option><option value=''>International Relations and Politics</option>\n\
                                <option value=''>Law</option><option value=''>Politics</option><option value=''>Psychology</option><option value=''>Scots Law</option><option value=''>Spatial Economics and Development</option>\n\
                                <option value=''>Town and Regional Planning</option><option value=''>Other/Not Listed</option>");
        } else if (val == "artAbertay") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Computer Arts</option><option value=''>Creative Sound Production</option><option value=''>Game Design & Product Management</option><option value=''>Computer Game Applications Development</option>\n\
                                <option value=''>Computer Games Technology</option><option value=''>Games Development</option><option value=''>Other/Not Listed</option>");
        } else if (val == "business") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Accounting with Finance</option><option value=''>Business Studies</option><option value=''>International Finance and Accounting</option>\n\
                                <option value=''>International Human Resource Management</option><option value=''>International Management</option><option value=''>Oil and Gas Management</option><option value=''>Law</option>\n\
                                <option value=''>EU Security and Transnational Criminal Justice</option><option value=''>Other/Not Listed</option>");
        } else if (val == "scienceAbertay") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Biomedical Science</option><option value=''>Civil Engineering</option><option value=''>Civil and Environmental Engineering</option><option value=''>Environmental Science and Technology</option>\n\
                                <option value=''>Food and Consumer Science</option><option value=''>Food, Nutrition and Health</option><option value=''>Forensic Sciences</option><option value=''>MSc Energy, Water and Environmental Management</option>\n\
                                <option value=''>MProf Food and Drink Innovation</option><option value=''>Other/Not Listed</option>");
        } else if (val == "socialHealth") {
            document.getElementById("subjectSection").className = "form-group";
            $("#subject").html("<option>-</option><option value=''>Counselling Skills</option><option value=''>Counselling Studies</option><option value=''>Criminological Studies</option><option value=''>Forensic Psychobiology</option><option value=''>Mental Health</option>\n\
                                <option value=''>Mental Health Nursing</option><option value=''>Nursing</option><option value=''>Physical Activity and Health</option><option value=''>Psychology</option><option value=''>Psychology and Counselling</option>\n\
                                <option value=''>Social Science</option><option value=''>Sociology</option><option value=''>Sports Coaching</option><option value=''>Sports Development</option><option value=''>Sport and Exercise</option><option value=''>Sport and Exercise Science</option>\n\
                                <option value=''>Sport and Management</option><option value=''>Sport and Psychology</option><option value=''>Strength and Conditioning</option>\n\
                                <option value=''>Other/Not Listed</option>");
        } else {
            $("#subject").html("<option vaue='N/A'>-</option>");
        }
    });

    ///Password check
    $("#confirmPassword").keyup(checkPassword);

    ///email Check
    $("#confirmEmail").keyup(checkEmail);
});

function checkUsername(username)
{
    var message;
    if (username === '')
    {
        message = "<div class='alert alert-warning fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Please Enter a Username.</p></div>";
        usernameValid = false;
    }
    else
    {
        var exists = false;
        $.ajax({
            type: "POST",
            url: "CheckUsername",
            async: false,
            data: {username: username},
            cache: false,
            success: function (result) {
                exists = result;
            },
            fail: function () {
                console.log("Error in ajax call");
            }
        });
        if (exists)
        {
            message = "<div id='errMessage' class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Username already exists.</p></div>";
        }
        else
        {
            message = "<div id='errMessage' class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Username is available.</p></div>";
        }
    }
    usernameValid = exists;
    return message;
}

function checkPassword()
{
    var password = $("#password1").val();
    var confirmPassword = $("#confirmPassword").val();

    if (password === '' && confirmPassword === '')
    {
        $("#passwordError").html("<div class='alert alert-warning fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Please Enter a Password.</p></div>");
        passwordValid = false;
    }
    else if (password !== confirmPassword)
    {
        $("#passwordError").html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Passwords Do Not Match.</p></div>");
        passwordValid = false;
    }
    else if (password === confirmPassword)
    {
        $("#passwordError").html("<div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Passwords Match.</p></div>");
        passwordValid = true;
    }
}

function checkEmail()
{
    var email = $("#email").val();
    var confirmEmail = $("#confirmEmail").val();

    if (email === '' && confirmEmail === '')
    {
        $("#emailError").html("<div class='alert alert-warning fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Please Enter an E-mail Address.</p></div>");
        emailValid = false;
    }
    else if (email !== confirmEmail)
    {
        $("#emailError").html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>E-mail Addresses Do Not Match.</p></div>");
        emailValid = false;
    }
    else if (email === confirmEmail)
    {
        $("#emailError").html("<div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>E-mail Addresses Match.</p></div>");
        emailValid = true;
    }
}

function validateForm()
{
    if (emailValid && passwordValid && usernameValid)
    {
        return true;
    }
    else
    {
                     $("#modalHeader").text("Error!");
        $("#modalText").text("Invalid input.");
        $('#myModal').modal('show');
        return false;      
    }
}