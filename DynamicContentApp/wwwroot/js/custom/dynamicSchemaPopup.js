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
    $('#btnSaveMasterLayout').click(function (e) {
        e.preventDefault(); // This stops the form from submitting and redirecting
        e.stopPropagation();
       // alert("inside #btnSaveMasterLayout");
        
        // Open the child popup window
        var masterpagePath = $("#txtMasterPageItem").val();
       // var isItemPageType = $("#chkIsItemPageType").val();
        var isItemPageType = $('#chkIsItemPageType').is(':checked'); 
        var assetItemID = $('[id="txtSchemaID"]').val();
        //alert(txtSchemaID+ ' '+masterpagePath + ' ' + isItemPageType);
        saveAssetMasterLayoutDetails(assetItemID, isItemPageType, masterpagePath);

        //window.open('popup.html', 'DataSelectionPopup', 'width=400,height=300');
        //alert("inside open popup button");
        return false;
    });
   
});
function saveAssetMasterLayoutDetails(assetItemID, isItemPageType, masterpagePath) {
  //alert(assetItemID + ' ' + isItemPageType + ' ' + masterpagePath );

    $.ajax({
        type: "GET",
        url: "/ContentTree/SaveAssetMasterLayoutDetails", // PageName/MethodName
        //data: JSON.stringify(requestData),
        data: { AssetItemID: assetItemID, IsItemPageType: isItemPageType, MasterpagePath: masterpagePath },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response == true) {
                alert("Successfully saved:" );
            }
            else {
                alert("Failed while saving");
            }
         
        },
        error: function (xhr, status, error) {

            console.error("Error occurred:", error);
            //alert("Error occurred:" + error);
        }
    });
}
// Optional: A custom function the popup can call directly
function receiveDataFromPopup(data) {
    $('#txtAssetItemSchema').val(data);
}