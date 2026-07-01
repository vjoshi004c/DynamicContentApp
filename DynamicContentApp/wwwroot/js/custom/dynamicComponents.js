$(document).ready(function () {

    $("#btnAddComponents").on("click", function (e) {

        e.preventDefault(); // This stops the form from submitting and redirecting
        e.stopPropagation();

        //$("#dynamicFormContainer_Edit").style.display = "block";
        $("#dynamicFormContainer_Component").css("display", "block");
        // Example data array (could come from API, DB, etc.)
        const optionsData = [
            { value: "", text: "-Select Field Type -" },
            { value: "1", text: "Text" },
            { value: "2", text: "Multiline" },
            { value: "3", text: "HtmlText" }
        ];



        // Remove any existing dropdown before creating a new one
         $("#dynamicFormContainer_Component").empty();

        // Create the <select> element
        const $select = $("<select>", {
            id: "FieldTypeSelect",
            name: "FieldTypeSelect"
        });
        getFieldType(optionsData);
        // Populate dropdown with options
        $.each(optionsData, function (index, item) {
            // Validate that both value and text exist
            if (typeof item.value === "string" && typeof item.text === "string") {
                $("<option>", {
                    value: item.value,
                    text: item.text
                }).appendTo($select);
            }
        });

        // Append the dropdown to the container
        // $("#dynamicFormContainer").append($select);

        // Optional: Add change event listener
        $select.on("change", function () {
            //alert("You selected: " + $(this).val());
        });


        const form = $('<form>').attr({ method: 'post', action: 'component', id: 'dynamicComponentform' });
        const SchemaIDInput = $('<input>').attr({ type: 'hidden', name: 'hdnFieldSchemaIDComponent', placeholder: 'SchemaID' });
        form.append(SchemaIDInput);

        const SchemaComponentLabel = $('<div>').attr({ style: 'padding-bottom:0.2em;width:80%', });
        // const AssetFieldNameLabel = $('<input>').attr({ type: 'text', name: 'AssetFieldName', value:schemaFieldName, placeholder: 'Asset Field Name Label' , style:'width:80%;background-color:#D3E0C3;border-color:#D3E0C3'});
        const FieldNameeLabelComponent = $("<label>", { for: 'componentID', class: "form-label", text: 'Component Path (Include component under selected page asset Item)', style: 'width:80%;background-color:#D3E0C3;border-color:none' });
        SchemaComponentLabel.append(FieldNameeLabelComponent);
        form.append(SchemaComponentLabel);

        const SchemaSpanComponent = $('<div>').attr({ style: 'padding:1em;', });
        const FieldNameeInputComponent = $('<input>').attr({ type: 'text', id: 'componentID', name: 'ComponentName', placeholder: 'Select Component ', style: 'width:80%;' });
        SchemaSpanComponent.append(FieldNameeInputComponent);
        form.append(SchemaSpanComponent);

        const SchemaDataSourceLabel = $('<div>').attr({ style: 'padding-bottom:0.2em;width:80%', });
        // const AssetFieldNameLabel = $('<input>').attr({ type: 'text', name: 'AssetFieldName', value:schemaFieldName, placeholder: 'Asset Field Name Label' , style:'width:80%;background-color:#D3E0C3;border-color:#D3E0C3'});
        const FieldNameeLabelDataSource = $("<label>", { for: 'datasourceID', class: "form-label", text: 'Content path (Select content asset path associated with Component)', style: 'width:80%;background-color:#D3E0C3;border-color:none' });
        SchemaDataSourceLabel.append(FieldNameeLabelDataSource);
        form.append(SchemaDataSourceLabel);

        const SchemaSpanDatasource = $('<div>').attr({ style: 'padding:1em;', });
        const FieldNameeInputDataSource = $('<input>').attr({ type: 'text', id: 'datasourceID', name: 'DataSourceName', placeholder: 'Select DataSource Path', style: 'width:80%;' });
        SchemaSpanDatasource.append(FieldNameeInputDataSource);
        form.append(SchemaSpanDatasource);

        const SchemaPlaceholderLabel = $('<div>').attr({ style: 'padding-bottom:0.2em;width:80%', });
        // const AssetFieldNameLabel = $('<input>').attr({ type: 'text', name: 'AssetFieldName', value:schemaFieldName, placeholder: 'Asset Field Name Label' , style:'width:80%;background-color:#D3E0C3;border-color:#D3E0C3'});
        const FieldNameeLabelPlaceholder = $("<label>", { for: 'placeholderID', class: "form-label", text: 'Placeholder (Select placeholder where component will render)', style: 'width:80%;background-color:#D3E0C3;border-color:none' });
        SchemaPlaceholderLabel.append(FieldNameeLabelPlaceholder);
        form.append(SchemaPlaceholderLabel);

        const SchemaSpanPlaceholder = $('<div>').attr({ style: 'padding:1em;', });
        const FieldNameeInputPlaceholder = $('<input>').attr({ type: 'text', id: 'placeholderID', name: 'PlaceholderName', placeholder: 'Select Placeholder ', style: 'width:80%;' });
        SchemaSpanPlaceholder.append(FieldNameeInputPlaceholder);
        form.append(SchemaSpanPlaceholder);

        const SchemaSpan2 = $('<div>').attr({ style: 'padding:1em;', });
        SchemaSpan2.append($select);
        //form.append(SchemaSpan2);

        const SchemaSpan3 = $('<div>').attr({ style: 'padding:1em;', });
        const submitButton = $('<input>').attr({ type: 'submit', value: 'Save Component', class: 'unfake-disabled-button' });
        SchemaSpan2.append(submitButton);
        form.append(submitButton);

        $("#dynamicFormContainer_Component").append(form);
        //$("#dynamicFormContainer_Edit").style.display = "block";
        //$("#dynamicform").style.display = "block";



        submitButton.on("click", function () {
                e.preventDefault(); // This stops the form from submitting and redirecting
                e.stopPropagation();

                var form = $("#dynamicComponentform");
                //var hdnFieldSchemaID = $('[name="hdnFieldSchemaIDComponent"]');
                //var txtAssetID = $("txtSchemaID");
                //alert("componetn submit button" + hdnFieldSchemaID);
                //alert("AssetId: " + txtSchemaID.val());
                //hdnFieldSchemaID.val(txtAssetID.val());

                var hdnFieldSchemaIDComponent = $('[name="hdnFieldSchemaIDComponent"]');
                var txtSchemaID = $('[id="txtSchemaID"]');
                hdnFieldSchemaIDComponent.val(txtSchemaID.val());
                var fieldSchemaIDComponent = hdnFieldSchemaIDComponent.val();

                var formData = form.serializeArray();
                let componentPath = '';
                let linkedAssetItem = '';
                let placeholderPath = '';


                formData.forEach(function (field) {
                    if (field.name == 'ComponentName') { componentPath = field.value }
                    if (field.name == 'DataSourceName') { linkedAssetItem = field.value }
                    if (field.name == 'PlaceholderName') { placeholderPath = field.value }


                });
            //alert(fieldSchemaIDComponent +' ' +componentPath + ' ' + linkedAssetItem + ' ' + placeholderPath);
                if (componentPath == '') {
                    alert("Component field  should not be blank.Please enter component path");
                    return false;
                }
                if (linkedAssetItem == '') {
                    alert("Linked asset item should not be blank. Please enter asset item path");
                    return false;
                }
                if (placeholderPath == '') {
                    alert("Placeholder should not be blank.Please enter placeholder name");
                    return false;
                }
            //alert(schemaFieldid + ": " + schemaFieldName + ": " + schemaFieldType);
            saveAssetItemComponent(fieldSchemaIDComponent, componentPath, linkedAssetItem, placeholderPath);
            $("#dynamicComponentform").empty();
            //$("#dynamicFormContainer_Edit").style.display = "none";
            $("#dynamicFormContainer_Component").css("display", "none");
            return false;
            });


        //alert("btnEditSchemaFields");
        return false;
        });




    //function saveAssetItemComponent(fieldSchemaIDComponent, componentPath, linkedAssetItem, placeholderPath) {
    //   // alert(fieldSchemaIDComponent + ' ' + componentPath + ' ' + linkedAssetItem + ' ' + placeholderPath);

    //    $.ajax({
    //        type: "GET",
    //        url: "/ContentTree/SaveAssetComponentDetails", // PageName/MethodName
    //        //data: JSON.stringify(requestData),
    //        data: { AssetItemID: fieldSchemaIDComponent, ComponentPath: componentPath, LinkedAssetItem: linkedAssetItem,  PlaceholderPath: placeholderPath },
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (response) {
    //                 if (response == true) {
    //                        alert("Successfully saved:");
    //                    }
    //                    else {
    //                        alert("Failed while saving");
    //                    }
    //        },
    //        error: function (xhr, status, error) {

    //            console.error("Error occurred:", error);
    //            //alert("Error occurred:" + error);
    //        }
    //    });
    //}
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


        //$.each(optionsData, function (index, item) {
        //    // Validate that both value and text exist
        //    alert(item.value + "  " + item.text);

        //});

    }
    
   
});
function saveAssetItemComponent(fieldSchemaIDComponent, componentPath, linkedAssetItem, placeholderPath) {
    // alert(fieldSchemaIDComponent + ' ' + componentPath + ' ' + linkedAssetItem + ' ' + placeholderPath);

    $.ajax({
        type: "GET",
        url: "/ContentTree/SaveAssetComponentDetails", // PageName/MethodName
        //data: JSON.stringify(requestData),
        data: { AssetItemID: fieldSchemaIDComponent, ComponentPath: componentPath, LinkedAssetItem: linkedAssetItem, PlaceholderPath: placeholderPath },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response == true) {
                alert("Successfully saved:");
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
function EditAssetFieldComponentDetails(fieldSchemaIDComponent, componentPath, linkedAssetItem, placeholderPath) {
    alert("EditAssetFieldComponentDetailsNew dynamic" + fieldSchemaIDComponent + ' ' + componentPath + ' ' + linkedAssetItem + ' ' + placeholderPath);

   // e.preventDefault(); // This stops the form from submitting and redirecting
   // e.stopPropagation();
    $("#dynamicFormContainer_Component").css("display", "block");
    $("#dynamicFormContainer_Component").empty();
 
    const form = $('<form>').attr({ method: 'post', action: 'component', id: 'dynamicComponentform' });
    const SchemaIDInput = $('<input>').attr({ type: 'hidden', name: 'hdnFieldSchemaIDComponent', placeholder: 'SchemaID' , value: fieldSchemaIDComponent });
    form.append(SchemaIDInput);

    const SchemaComponentLabel = $('<div>').attr({ style: 'padding-bottom:0.2em;width:80%', });
    // const AssetFieldNameLabel = $('<input>').attr({ type: 'text', name: 'AssetFieldName', value:schemaFieldName, placeholder: 'Asset Field Name Label' , style:'width:80%;background-color:#D3E0C3;border-color:#D3E0C3'});
    const FieldNameeLabelComponent = $("<label>", { for: 'componentID', class: "form-label", text: 'Component Path (Include component under selected page asset Item)', style: 'width:80%;background-color:#D3E0C3;border-color:none' });
    SchemaComponentLabel.append(FieldNameeLabelComponent);
    form.append(SchemaComponentLabel);

    const SchemaSpanComponent = $('<div>').attr({ style: 'padding:1em;', });
    const FieldNameeInputComponent = $('<input>').attr({ type: 'text', id: 'componentID', name: 'ComponentName', placeholder: 'Select Component ', style: 'width:80%;', value: componentPath });
    SchemaSpanComponent.append(FieldNameeInputComponent);
    form.append(SchemaSpanComponent);

    const SchemaDataSourceLabel = $('<div>').attr({ style: 'padding-bottom:0.2em;width:80%', });
    // const AssetFieldNameLabel = $('<input>').attr({ type: 'text', name: 'AssetFieldName', value:schemaFieldName, placeholder: 'Asset Field Name Label' , style:'width:80%;background-color:#D3E0C3;border-color:#D3E0C3'});
    const FieldNameeLabelDataSource = $("<label>", { for: 'datasourceID', class: "form-label", text: 'Content path (Select content asset path associated with Component)', style: 'width:80%;background-color:#D3E0C3;border-color:none' });
    SchemaDataSourceLabel.append(FieldNameeLabelDataSource);
    form.append(SchemaDataSourceLabel);

    const SchemaSpanDatasource = $('<div>').attr({ style: 'padding:1em;', });
    const FieldNameeInputDataSource = $('<input>').attr({ type: 'text', id: 'datasourceID', name: 'DataSourceName', placeholder: 'Select DataSource Path', style: 'width:80%;', value: linkedAssetItem });
    SchemaSpanDatasource.append(FieldNameeInputDataSource);
    form.append(SchemaSpanDatasource);

    const SchemaPlaceholderLabel = $('<div>').attr({ style: 'padding-bottom:0.2em;width:80%', });
    // const AssetFieldNameLabel = $('<input>').attr({ type: 'text', name: 'AssetFieldName', value:schemaFieldName, placeholder: 'Asset Field Name Label' , style:'width:80%;background-color:#D3E0C3;border-color:#D3E0C3'});
    const FieldNameeLabelPlaceholder = $("<label>", { for: 'placeholderID', class: "form-label", text: 'Placeholder (Select placeholder where component will render)', style: 'width:80%;background-color:#D3E0C3;border-color:none' });
    SchemaPlaceholderLabel.append(FieldNameeLabelPlaceholder);
    form.append(SchemaPlaceholderLabel);

    const SchemaSpanPlaceholder = $('<div>').attr({ style: 'padding:1em;', });
    const FieldNameeInputPlaceholder = $('<input>').attr({ type: 'text', id: 'placeholderID', name: 'PlaceholderName', placeholder: 'Select Placeholder ', style: 'width:80%;', value: placeholderPath });
    SchemaSpanPlaceholder.append(FieldNameeInputPlaceholder);
    form.append(SchemaSpanPlaceholder);

   // const SchemaSpan2 = $('<div>').attr({ style: 'padding:1em;', });
   // SchemaSpan2.append($select);
    //form.append(SchemaSpan2);

    const SchemaSpan3 = $('<div>').attr({ style: 'padding:1em;', });
    const submitButton = $('<input>').attr({ type: 'submit', value: 'Save Component', class: 'unfake-disabled-button' });
    SchemaSpan3.append(submitButton);
    form.append(SchemaSpan3);

    $("#dynamicFormContainer_Component").append(form);
    //$("#dynamicFormContainer_Edit").style.display = "block";
    //$("#dynamicform").style.display = "block";



    submitButton.on("click", function (e) {
        e.preventDefault(); // This stops the form from submitting and redirecting
        e.stopPropagation();

        var form = $("#dynamicComponentform");
        //var hdnFieldSchemaID = $('[name="hdnFieldSchemaIDComponent"]');
        //var txtAssetID = $("txtSchemaID");
        //alert("componetn submit button" + hdnFieldSchemaID);
        //alert("AssetId: " + txtSchemaID.val());
        //hdnFieldSchemaID.val(txtAssetID.val());

        var hdnFieldSchemaIDComponent = $('[name="hdnFieldSchemaIDComponent"]');
        var txtSchemaID = $('[id="txtSchemaID"]');
        hdnFieldSchemaIDComponent.val(txtSchemaID.val());
        var fieldSchemaIDComponent = hdnFieldSchemaIDComponent.val();

        var formData = form.serializeArray();
        let componentPath = '';
        let linkedAssetItem = '';
        let placeholderPath = '';


        formData.forEach(function (field) {
            if (field.name == 'ComponentName') { componentPath = field.value }
            if (field.name == 'DataSourceName') { linkedAssetItem = field.value }
            if (field.name == 'PlaceholderName') { placeholderPath = field.value }


        });
        //alert(fieldSchemaIDComponent +' ' +componentPath + ' ' + linkedAssetItem + ' ' + placeholderPath);
        if (componentPath == '') {
            alert("Component field  should not be blank.Please enter component path");
            return false;
        }
        if (linkedAssetItem == '') {
            alert("Linked asset item should not be blank. Please enter asset item path");
            return false;
        }
        if (placeholderPath == '') {
            alert("Placeholder should not be blank.Please enter placeholder name");
            return false;
        }
        alert(fieldSchemaIDComponent + ": " + componentPath + ": " + linkedAssetItem, placeholderPath);
        saveAssetItemComponent(fieldSchemaIDComponent, componentPath, linkedAssetItem, placeholderPath);
        $("#dynamicComponentform").empty();
        //$("#dynamicFormContainer_Edit").style.display = "none";
        $("#dynamicFormContainer_Component").css("display", "none");
        return false;
    });
}