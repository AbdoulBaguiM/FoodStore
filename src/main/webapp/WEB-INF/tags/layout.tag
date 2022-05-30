<%@attribute name="title" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:invoke fragment="title"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href='${pageContext.request.contextPath}/assets/css/style.css'/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!-- HEADER -->
    <jsp:include page="/views/extras/header.jsp"/>
    <!-- /HEADER -->

    <!-- NAVIGATION -->
    <jsp:include page="/views/extras/navigation.jsp"/>
    <!-- /NAVIGATION -->

    <div id="body">
        <jsp:doBody/>
    </div>

    <!-- NEWSLETTER -->
    <jsp:include page="/views/extras/newsletter.jsp"/>
    <!-- /NEWSLETTER -->

    <!-- FOOTER -->
    <jsp:include page="/views/extras/footer.jsp"/>
    <!-- /FOOTER -->

    <!-- EXTRAS(js) -->
    <jsp:invoke fragment="footer"/>
    <!-- EXTRAS(js) -->

    <!-- jQuery Plugins -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/cart.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/axios.js"></script>
    <script>
        (function(){
            const classname = document.querySelectorAll('.quantity')

            Array.from(classname).forEach(function(element) {
                element.addEventListener('change', function() {
                    const params = new URLSearchParams();
                    const id = element.getAttribute('data-id')

                    params.append('id', id);
                    params.append('qte',this.value)

                    axios.post('/panier', params)
                        .then(function (response) {
                            window.location.href = '/panier'
                        })
                        .catch(function (error) {
                            console.log(response);
                        });
                })
            })
        })();
    </script>
</body>
</html>