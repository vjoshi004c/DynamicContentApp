$(document).ready(function () {
   // alert("inside language dropdown ");
    const optionsData = [
        { value: "0", text: "-Select Language -" }
    ]; 

    const optionsVersionData = [
        { value: "0", text: "-Select Version -" }
    ];

    const $hdnCurrentSelectAssetItem = $('#hdnCurrentSelectAssetItem');
    const $hdnCurrentSelectAssetParentItem = $('#hdnCurrentSelectAssetParentItem');

    const $hdn_CurrentLanguage_ID = $('#hdn_CurrentLanguage_ID');
    const $hdn_CurrentVersion_ID_OnChange = $('#hdn_CurrentVersion_ID_OnChange');
    const $hdn_CurrentLanguage_Text = $('#hdn_CurrentLanguage_Text');
    const $hdn_CurrentVersion_ID = $('#hdn_CurrentVersion_ID');
     const $hdn_CurrentVersion_Text = $('#hdn_CurrentVersion_Text');

    const $selectLanguage = $('#ddlLanguage');
    const $selectVersion = $('#ddlVersion');
    const $btnNewVersion = $('#btnNewVersion');
    
    getLanguages(optionsData);
    //alert($hdnCurrentSelectAssetItem.val());
   // alert( $hdn_CurrentLanguage_ID.val());
    //getVersion(optionsVersionData,$hdnCurrentSelectAssetItem.val() , $hdn_CurrentLanguage_ID.val()) ;

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
     $.each(optionsVersionData, function (index, item) {
        // Validate that both value and text exist
        if (typeof item.value === "string" && typeof item.text === "string") {
            $("<option>", {
                value: item.value,
                text: item.text
            }).appendTo($selectVersion);
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
     $selectVersion.val($hdn_CurrentVersion_ID.val());
      $("#txtCurrentLanguage").val($hdn_CurrentLanguage_Text.val());
       $("#txtCurrentVersion").val($hdn_CurrentVersion_Text.val());
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
         //alert($("#lblCurrentLanguage").html());
          $("#txtCurrentLanguage").val(selectedText);
        // var lblOfCurrentLangaeg = $("#lblCurrentLanguage").html();
   // $("#lblCurrentLanguage").html(lblOfCurrentLangaeg + "-" + selectedText);
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
        // alert("You selected value -" + selectedID);
   // var txtFieldDatasource = $(this).closest('form').find('input[id="txtFieldDatasource"]').css("display", "none");
   // $(this).closest('form').find('input[id="txtFieldDatasource"]').val('');
    var CurrentSelectAssetItem = $hdnCurrentSelectAssetItem.val();
     var CurrentSelectAssetParentItem = $hdnCurrentSelectAssetParentItem.val();
    //  alert("You selected CurrentSelectAssetItem - " + CurrentSelectAssetItem);
    // alert("You selected CurrentSelectAssetParentItem -" + CurrentSelectAssetParentItem);
    var selectedID = $(this).val();
    var selectedText = $(this).find("option:selected").text();
   
    
    // alert("You selected text -" + selectedText);
       $("#txtCurrentVersion").val(selectedText);
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

 $btnNewVersion.on("click", function () {
                //alert("btnNewVersion click" );
               // e.preventDefault(); // This stops the form from submitting and redirecting
                //e.stopPropagation();
                  const $hdnCurrentSelectAssetItem = $('#hdnCurrentSelectAssetItem');
                      const $hdn_CurrentLanguage_ID = $('#hdn_CurrentLanguage_ID');
                    var currentSelectAssetItem = $hdnCurrentSelectAssetItem.val();
                    var currentLanguageID = $hdn_CurrentLanguage_ID.val();
                    var defaultLanguageID = "ABA8A444-C2F0-4EF5-AD74-A7CDB1D90C23";
                     //alert("btnNewVersion click" );
                                   //alert(currentSelectAssetItem);
                                   // alert(currentLanguageID);
                                   // alert(defaultLanguageID);

                      $.ajax({
                                                             type: "GET",
                                                              url: "/ContentTree/CreateNewVersion", // PageName/MethodName
                                                             //data: JSON.stringify(requestData),
                                                                         data: { CurrentSelectAssetItem: currentSelectAssetItem, CurrentLanguageID: currentLanguageID, DefaultLanguageID: defaultLanguageID },
                                                             contentType: "application/json; charset=utf-8",
                                                              dataType: "json",
                                                               async: false,
                                                             success: function (response) {
                                                                // alert("success");
                                                              console.log("Success:", response);
                                                               showAlert("New version of selected asset has been created.");
                                                                ViewContentItem($currentSelectAssetItem) ;
                                                              

                                                          },
                                                       error: function (xhr, status, error) {
                                                            showAlert("Oops! Error while creating new version of selected asset.");
                                                              console.error("Error occurred:", error);

                                                          }
                                                  });




                })

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

    function getVersion(optionsVersionData, currentSelectAssetItem , currentLanguage_ID) {
       //alert("getFieldType"  +currentSelectAssetItem + currentLanguage_ID);

        $.ajax({
            type: "GET",
            url: "/ContentTree/GetVersions", // PageName/MethodName
            //data: JSON.stringify(requestData),
              data: { CurrentSelectAssetItem: currentSelectAssetItem, CurrentLanguage_ID: currentLanguage_ID },
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                //alert(response.message + " Status is: " + response.status);
                //alert("Total records received: " + response.length);
                $.each(response, function (index, record) {
                    const newElement = "{ value:\"" + record.number + "\", text: \"" + record.text +"\"}";
                    let newItem = { value: record.id, text: record.language };
                    optionsVersionData.push(newItem);

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
                                                           // showAlert("Selected language set successfully.");
                                                                         //alert(assetItemTreeeID);
                                                                 ViewContentItem( currentSelectAssetItem) 
                                                             }
                                                              else {
                                                                 showAlert("Oops! Error while setting language.");
                                                                      //alert("Failed while saving");
                                                                              //ViewContentItem( currentSelectAssetItem)
                                                                }

                        },
                        error: function (xhr, status, error) {

                            console.error("Error occurred:", error);
                           // alert("Error occurred:" + error);
                              showAlert("Oops! Error while setting language.");
                        }
                    });
                }
                // function getVersion(optionsVersionData, currentSelectAssetItem , currentLanguage_ID) {
                //        //alert("getFieldType"  +currentSelectAssetItem + currentLanguage_ID);

                //         $.ajax({
                //             type: "GET",
                //             url: "/ContentTree/GetVersions", // PageName/MethodName
                //             //data: JSON.stringify(requestData),
                //               data: { CurrentSelectAssetItem: currentSelectAssetItem, CurrentLanguage_ID: currentLanguage_ID },
                //             contentType: "application/json; charset=utf-8",
                //             dataType: "json",
                //             async: false,
                //             success: function (response) {
                //                 //alert(response.message + " Status is: " + response.status);
                //                 //alert("Total records received: " + response.length);
                //                  if (response.length >0){
                //                 $.each(response, function (index, record) {
                //                     const newElement = "{ value:\"" + record.number + "\", text: \"" + record.text +"\"}";
                //                     //alert(newElement);
                //                     let newItem = { value: record.number, text: record.text };
                //                     optionsVersionData.push(newItem);

                //                 });
                //                  }
                //                  else
                //                  {
                //                      showAlert("Oops! No version available for current selected languagae");
                //                  }

                //             },
                //             error: function (xhr, status, error) {

                //                 console.error("Error occurred:", error);
                //                 alert("Error occurred:" + error);
                //             }
                //         });
                //     }
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
                                                   // $hdn_CurrentVersion.val(selectedVersionText);
                                                    $hdn_CurrentVersion_ID.val(selectedVersionID);
                                                    $hdn_CurrentVersion_ID_OnChange.val("true");
                                                    $hdn_CurrentVersion_Text.val(selectedVersionText);
                                                            showAlert("Selected Version set successfully.");
                                                                        // alert($hdn_CurrentVersion_ID.val());
                                                                 ViewContentItem( currentSelectAssetItem) 
                                                             }
                                                              else {
                                                                 showAlert("Oops! Error while setting version.");
                                                                      //alert("Failed while saving");
                                                                            // ViewContentItem( currentSelectAssetItem)
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
