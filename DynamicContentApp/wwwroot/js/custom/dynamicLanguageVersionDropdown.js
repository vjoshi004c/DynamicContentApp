$(document).ready(function () {
   // alert("inside language dropdown ");
    const optionsData = [
        { value: "0", text: "-Select Language -" }
    ]; 

    const $hdnCurrentSelectAssetItem = $('#hdnCurrentSelectAssetItem');
    const $hdnCurrentSelectAssetParentItem = $('#hdnCurrentSelectAssetParentItem');

    const $hdn_CurrentLanguage_ID = $('#hdn_CurrentLanguage_ID');
    const $hdn_CurrentLanguage_Text = $('#hdn_CurrentLanguage_Text');
    const $hdn_CurrentVersion = $('#hdn_CurrentVersion');

    const $selectLanguage = $('#ddlLanguage');
    const $selectVersion = $('#ddlVersion');
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
   // alert("Current Language ID - " + $hdn_CurrentLanguage_ID.val());
    $selectLanguage.val($hdn_CurrentLanguage_ID.val());
     $selectVersion.val($hdn_CurrentVersion.val());
    $selectLanguage.on("change", function () {
       // var txtFieldDatasource = $(this).closest('form').find('input[id="txtFieldDatasource"]').css("display", "none");
       // $(this).closest('form').find('input[id="txtFieldDatasource"]').val('');
           var CurrentSelectAssetItem = $hdnCurrentSelectAssetItem.val();
             var CurrentSelectAssetParentItem = $hdnCurrentSelectAssetParentItem.val();
             // alert("You selected CurrentSelectAssetItem - " + CurrentSelectAssetItem);
             //alert("You selected CurrentSelectAssetParentItem -" + CurrentSelectAssetParentItem);
        var selectedID = $(this).val();
        var selectedText = $(this).find("option:selected").text();
        //alert("You selected: " + selectedID);
       // alert("You selected: " + selectedText);
            setLanguages(selectedID, selectedText ,CurrentSelectAssetItem);
        //if (selectedText.toUpperCase() === "CONTENT_ITEM") {
        //    //alert("You selected: " + selectedID);
        //    //alert("You selected: " + selectedText);
        //    $("#spanAssetItemSchema_Add").css("display", "block");
        //}
        //if (selectedText.toUpperCase() === "DROPDOWN" || selectedText.toUpperCase() === "MULTILIST") {
        //    var txtFieldDatasource = $(this).closest('form').find('input[id="txtFieldDatasource"]').css("display", "block");
        //}
    });
    $selectVersion.on("change", function () {
   // var txtFieldDatasource = $(this).closest('form').find('input[id="txtFieldDatasource"]').css("display", "none");
   // $(this).closest('form').find('input[id="txtFieldDatasource"]').val('');
    var CurrentSelectAssetItem = $hdnCurrentSelectAssetItem.val();
     var CurrentSelectAssetParentItem = $hdnCurrentSelectAssetParentItem.val();
    //  alert("You selected CurrentSelectAssetItem - " + CurrentSelectAssetItem);
    // alert("You selected CurrentSelectAssetParentItem -" + CurrentSelectAssetParentItem);
    var selectedID = $(this).val();
    var selectedText = $(this).find("option:selected").text();
    // alert("You selected value -" + selectedID);
    // alert("You selected text -" + selectedText);
    setVersion(selectedID, selectedText ,CurrentSelectAssetItem)
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

    function setLanguages(selectedLanguageID, selectedLanguageTText , currentSelectAssetItem) {
                  

                    $.ajax({
                        type: "GET",
                        url: "/ContentTree/setLanguages", // PageName/MethodName
                        //data: JSON.stringify(requestData),
                        data: { SelectedLanguageID: selectedLanguageID, SelectedLanguageText: selectedLanguageTText, CurrentSelectAssetItem: currentSelectAssetItem },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (response) {
                            if (response === true){
                                                    $hdn_CurrentLanguage_ID.val(selectedLanguageID);
                                                    $hdn_CurrentLanguage_Text.val(selectedLanguageTText);
                                                            showAlert("Selected language set successfully.");
                                                                         //alert(assetItemTreeeID);
                                                                 ViewContentItem( currentSelectAssetItem) 
                                                             }
                                                              else {
                                                                 showAlert("Oops! Error while setting language.");
                                                                      //alert("Failed while saving");
                                                                              ViewContentItem( currentSelectAssetItem)
                                                                }

                        },
                        error: function (xhr, status, error) {

                            console.error("Error occurred:", error);
                           // alert("Error occurred:" + error);
                              showAlert("Oops! Error while setting language.");
                        }
                    });
                }
 function setVersion(selectedVersionID, selectedVersionText ,currentSelectAssetItem) {
                  

                    $.ajax({
                        type: "GET",
                        url: "/ContentTree/setVersion", // PageName/MethodName
                        //data: JSON.stringify(requestData),
                        data: { SelectedVersionID: selectedVersionID, SelectedVersionText: selectedVersionText, CurrentSelectAssetItem: currentSelectAssetItem },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (response) {
                            if (response === true){
                                                    $hdn_CurrentVersion.val(selectedVersionText);
                                                            showAlert("Selected Version set successfully.");
                                                                         //alert(assetItemTreeeID);
                                                                 ViewContentItem( currentSelectAssetItem) 
                                                             }
                                                              else {
                                                                 showAlert("Oops! Error while setting version.");
                                                                      //alert("Failed while saving");
                                                                             ViewContentItem( currentSelectAssetItem)
                                                                }

                        },
                        error: function (xhr, status, error) {

                            console.error("Error occurred:", error);
                           // alert("Error occurred:" + error);
                              showAlert("Oops! Error while setting version.");
                        }
                    });
                }


});
