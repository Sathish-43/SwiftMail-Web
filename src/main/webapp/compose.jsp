<!DOCTYPE html>
<html>
<head>
    <title>Mail GUI</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function loadContent(page) {
            if (page === 'Compose') {
                document.getElementById("mainContent").innerHTML = `
                    <h3>Compose Mail</h3>
                    <form action="sendMail.jsp" method="post">
                        <div class="mb-3">
                            <label for="from" class="form-label">From</label>
                            <input type="email" class="form-control" id="from" name="from" required>
                        </div>
                        <div class="mb-3">
                            <label for="to" class="form-label">To</label>
                            <input type="email" class="form-control" id="to" name="to" required>
                        </div>
                        <div class="mb-3">
                            <label for="subject" class="form-label">Subject</label>
                            <input type="text" class="form-control" id="subject" name="subject" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send</button>
                    </form>
                `;
            } else {
                document.getElementById("mainContent").innerHTML = "Loading " + page + "...";
                setTimeout(() => {
                    document.getElementById("mainContent").innerHTML = "<h3>" + page + "</h3><p>Content for " + page + "</p>";
                }, 500);
            }
        }
    </script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 col-lg-2 bg-light vh-100 p-3">
                <h4 class="mb-4">Mail</h4>
                <ul class="nav flex-column">
                    <li class="nav-item"><a href="#" class="nav-link" onclick="loadContent('Compose')">Compose</a></li>
                    <li class="nav-item"><a href="#" class="nav-link" onclick="loadContent('Inbox')">Inbox</a></li>
                    <li class="nav-item"><a href="#" class="nav-link" onclick="loadContent('Sent')">Sent</a></li>
                    <li class="nav-item"><a href="#" class="nav-link" onclick="loadContent('Draft')">Draft</a></li>
                    <li class="nav-item"><a href="#" class="nav-link" onclick="loadContent('Trash')">Trash</a></li>
                    <li class="nav-item"><a href="#" class="nav-link" onclick="loadContent('Important')">Important</a></li>
                </ul>
            </div>
            <div class="col-md-9 col-lg-10 p-4" id="mainContent">
                <h3>Welcome</h3>
                <p>Select an option from the left menu.</p>
            </div>
        </div>
    </div>
</body>
</html>
