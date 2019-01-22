<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="partials/head.jsp" />
<body class="cssjockey-ui ">

<div id="admin-panel">
    <div class="cj-hero cj-is-fullheight cj-is-primary">
        <div class="cj-hero-head"></div>
        <div class="cj-hero-body cj-p-0">
            <div class="cj-container cj-width-100">
                <div class="cj-columns cj-is-multiline cj-is-mobile">
                    <div class="cj-column cj-is-4-widescreen cj-is-4-desktop cj-is-12-tablet cj-is-12-mobile">&nbsp;</div>
                    <div class="cj-column cj-is-4-widescreen cj-is-4-desktop cj-is-12-tablet cj-is-12-mobile">
                        <div class="cj-content cj-text-center">
                            <h2 class="cj-logo cj-color-light">Footasylum</h2>
                        </div>
                        <div class="cj-box">
                            <div class="cj-content cj-text-center">
                            	<h4 class="cj-title cj-color-dark">Login to your account</h4>
                            	<span style="color:red;">${error_msg}</span>
				<form:form id="loginForm" action="login" method="POST" modelAttribute="user">
				    <div class="field-email cj-field" id="field-email">
					<div class="cj-control">
					<label for="email" class="cj-help cj-color-danger" />
					<form:input class="cj-input cj-is-default cj-is-medium" type="email" path="email" id="email" placeholder="Email address" />
					</div>
				    </div>

					<div class="field-password cj-field" id="field-password">
						<div class="cj-control">
						<label for="password" class="cj-help cj-color-danger" />
						<form:input class="cj-input cj-is-default cj-is-medium" type="password" path="password" id="password" placeholder="Password" />
						</div>
					</div>
					<div class="field-Sign-In cj-field" id="field-Sign-In">
						<div class="cj-control">
						<form:button class="cj-button cj-is-info cj-is-fullwidth" type="submit">Sign In</form:button>
						</div>
					</div>
				    </form:form>

				    <div class="cj-mt-30 cj-text-center">
					<a href="#" class="cj-color-info">Forgot password?</a><span class="cj-opacity-50 cj-m-10">|</span>
					Not yet a member? <a href="signup" class="cj-color-info">Sign Up</a>
				    </div>
                            </div>
                        </div>
                        <div class="cj-column cj-is-4-widescreen cj-is-4-desktop cj-is-12-tablet cj-is-12-mobile">&nbsp;</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cj-hero-footer">
            <div class="cj-text-center cj-pt-20 cj-pb-20">
                <span class="cj-opacity-50">2019 &copy; Footasylum</span>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="/ATS/js/jquery/jquery.js"></script>
<script src="/ATS/js/jquery/moment.js"></script>
<script src="/ATS/js/jquery/jquery-ui.js"></script>
<script src="/ATS/js/jquery/select2.min.js"></script>
<script src="/ATS/js/jquery/jquery.validate.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('#loginForm').validate({ // initialize the plugin
        rules: {
        	email: {
                required: true,
                email: true,
            },
            password: {
                required: true,
                minlength: 2
            }
        },
        messages: {
        	email: {
                required: "Please enter your email address!",
                email: "Enter valid email like: name@domain.com"
            },
            password: "Please enter valid password!"
        }

    });

});
</script>

</body>
</html>
