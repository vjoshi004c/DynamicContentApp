$(document).ready(function () {
    $('#openPopupBtn').click(function () {
        //alert("inside open popup button");
        //e.preventDefault(); // This stops the form from submitting and redirecting
        //e.stopPropagation();
        // Open the child popup window
        
        window.open('popup.html', 'DataSelectionPopup', 'width=400,height=300');
        //alert("inside open popup button");
        return false;
    });
});

// Optional: A custom function the popup can call directly
function receiveDataFromPopup(data) {
    $('#txtAssetItemSchema').val(data);
}