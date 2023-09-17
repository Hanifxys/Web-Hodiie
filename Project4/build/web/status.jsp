<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cek</title>
    <link rel="stylesheet" href="assets/statusstyle.css">
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="center">
        <form id="whatsappForm" action="https://api.whatsapp.com/send" method="GET">
<!--            <table>  
                    <tr>
                        <td>No tiket:</td>
                        <td><input type="text" name="ticketNumber" /></td>
                    </tr>
                </table>-->
                <input type="hidden" name="phone" value="6285155081994">
                <input type="hidden" name="text" value="Ticket : \n Bukti Pembayaran : ( jika menggunakan E-Wallet lampirkan screenshot">
                <input type="submit" value="Confirm Order">
            </form>
        </div>
        <script>
            document.getElementById("whatsappForm").addEventListener("submit", function (event) {
                event.preventDefault();
                var phoneNumber = "6285155081994";

                var message = "Ticket : \n Bukti Pembayaran : ( jika menggunakan E-Wallet lampirkan screenshot";

                window.location.href = "https://api.whatsapp.com/send?phone=" + phoneNumber + "&text=" + encodeURIComponent(message);
            });
        </script>
    
<!--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        $(document).ready(function () {
            const urlParams = new URLSearchParams(window.location.search);
            const status = urlParams.get('status');
            if (status !== null) {
                $('#statusModal').modal('show');
            }
        });
    </script>
    
     Status Popup Modal 
    <div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="statusModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="statusModalLabel">Status</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Status: <span id="statusValue"></span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>-->
</body>
</html>
