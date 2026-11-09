$(document).ready(function () {
   // alert("inside language dropdown ");
    const optionsData = [
        { value: "0", text: "-Select Language -" }
    ]; 

    const $selectLanguage = $('#ddlLanguage');
    //const $selectVersion = $('#ddlVersion');
    getLanguages(optionsData);

    $.each(optionsData, function (index, item) {
        // Validate that both value and text exist
        if (typeof item.value === "string" && typeof item.text === "string") {
            $("<option>", {
                value: item.value,
                text: item.text
            }).appendTo($selectLanguage);
            //$("<option>", {
            //    value: item.value,
            //    text: item.text
            //}).appendTo($select2);
           // alert("inside optiondata");
            //$('#AssetTypeDropdown_Add').append(
            //    $('<option></option>').val(value).html(text)
            //);
            //$('#AssetTypeDropdown_Edit').append(
            //    $('<option></option>').val(value).html(text)
            //);
        }
    });

    $selectLanguage.on("change", function () {
       // var txtFieldDatasource = $(this).closest('form').find('input[id="txtFieldDatasource"]').css("display", "none");
       // $(this).closest('form').find('input[id="txtFieldDatasource"]').val('');
        var selectedID = $(this).val();
        var selectedText = $(this).find("option:selected").text();
        alert("You selected: " + selectedID);
        alert("You selected: " + selectedText);
        //if (selectedText.toUpperCase() === "CONTENT_ITEM") {
        //    //alert("You selected: " + selectedID);
        //    //alert("You selected: " + selectedText);
        //    $("#spanAssetItemSchema_Add").css("display", "block");
        //}
        //if (selectedText.toUpperCase() === "DROPDOWN" || selectedText.toUpperCase() === "MULTILIST") {
        //    var txtFieldDatasource = $(this).closest('form').find('input[id="txtFieldDatasource"]').css("display", "block");
        //}
    });
   
    function getLanguages(optionsData) {
       // alert("getFieldType");

        $.ajax({
            type: "GET",
            url: "/ContentTree/GetLanguages", // PageName/MethodName
            //data: JSON.stringify(requestData),
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                //alert(response.message + " Status is: " + response.status);
                //alert("Total records received: " + response.length);
                $.each(response, function (index, record) {
                    const newElement = "{ value:\"" + record.id + "\", text: \"" + record.language +"("+ record.code +" - "+ record.marketRegion +")\"}";
                    let newItem = { value: record.id, text: record.language };
                    optionsData.push(newItem);

                });

            },
            error: function (xhr, status, error) {

                console.error("Error occurred:", error);
                alert("Error occurred:" + error);
            }
        });
    }

    

});
