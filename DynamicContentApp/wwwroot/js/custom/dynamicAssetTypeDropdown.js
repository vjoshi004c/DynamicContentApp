$(document).ready(function () {
    //alert("inside optiondata");
    const optionsData = [
        { value: "0", text: "-Select Field Type -" }
        //{ value: "1", text: "Text" },
        //{ value: "2", text: "Multiline" },
        //{ value: "3", text: "HtmlText" }
    ]; 
    const $select = $("<select>", {
        id: "FieldTypeSelect",
        name: "FieldTypeSelect"
    });
    const $select1 = $('#AssetTypeDropdown_Add');
    const $select2 = $('#AssetTypeDropdown_Edit');
    getFieldType(optionsData);

    //$.each(optionsData, function (index, item) {
        // Validate that both value and text exist
        //alert(item.value + "  " + item.text);

    //});

    $.each(optionsData, function (index, item) {
        // Validate that both value and text exist
        if (typeof item.value === "string" && typeof item.text === "string") {
            $("<option>", {
                value: item.value,
                text: item.text
            }).appendTo($select1);
            $("<option>", {
                value: item.value,
                text: item.text
            }).appendTo($select2);
           // alert("inside optiondata");
            //$('#AssetTypeDropdown_Add').append(
            //    $('<option></option>').val(value).html(text)
            //);
            //$('#AssetTypeDropdown_Edit').append(
            //    $('<option></option>').val(value).html(text)
            //);
        }
    });

    $select1.on("change", function () {

        var selectedID = $(this).val();
        var selectedText = $(this).find("option:selected").text();
        //alert("You selected: " + selectedID);
        //alert("You selected: " + selectedText);
        if (selectedText.toUpperCase() === "CONTENT_ITEM") {
            //alert("You selected: " + selectedID);
            //alert("You selected: " + selectedText);
            $("#spanAssetItemSchema_Add").css("display", "block");
        }
    });
    $select2.on("change", function () {
        var selectedID = $(this).val();
        var selectedText = $(this).find("option:selected").text();
        //alert(selectedText);
        if (selectedText.toUpperCase() === "CONTENT_ITEM") {
            //alert("You selected: " + selectedID);
            //alert("You selected: " + selectedText);
            $("#spanAssetItemSchema_Edit").css("display", "block");
        }
       
    });
    function getFieldType(optionsData) {
        //alert("getFieldType");

        $.ajax({
            type: "GET",
            url: "/ContentTree/GetFieldType", // PageName/MethodName
            //data: JSON.stringify(requestData),
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                //alert(response.message + " Status is: " + response.status);
                //alert("Total records received: " + response.length);
                $.each(response, function (index, record) {
                    const newElement = "{ value:\"" + record.id + "\", text: \"" + record.fieldType + "\"}";
                    let newItem = { value: record.id, text: record.fieldType };
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
