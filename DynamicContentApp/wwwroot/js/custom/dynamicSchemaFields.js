$(document).ready(function () {
   
    $("#btnEditSchemaFields").on("click", function (e) {
        e.preventDefault(); // This stops the form from submitting and redirecting
        e.stopPropagation();
        //$("#dynamicFormContainer_Edit").style.display = "block";
        $("#dynamicFormContainer_Edit").css("display", "block");
        // Example data array (could come from API, DB, etc.)
        const optionsData = [
            { value: "", text: "-Select Field Type -" },
            { value: "1", text: "Text" },
            { value: "2", text: "Multiline" },
            { value: "3", text: "HtmlText" }
        ];

        
        
        // Remove any existing dropdown before creating a new one
        $("#dynamicFormContainer_Edit").empty();

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


        const form = $('<form>').attr({ method: 'post', action: 'submit.php', id: 'dynamicform' });

        const SchemaSpan1 = $('<span>').attr({ style: 'padding-right:2em;', });
        const SchemaSpan2 = $('<span>').attr({ style: 'padding-right:2em;', });

        const SchemaIDInput = $('<input>').attr({ type: 'hidden', name: 'hdnFieldSchemaID', placeholder: 'SchemaID' });
        const FieldNameeInput = $('<input>').attr({ type: 'text', name: 'FieldName', placeholder: 'Enter Field Name' });
        //const FieldTypeInput = $('<input>').attr({ type: 'text', name: 'FieldType', placeholder: 'Select FieldType' });
        const submitButton = $('<input>').attr({ type: 'submit', value: 'Add new Field', class:'unfake-disabled-button' });
        //const submitButton = $('<input>').attr({ type: 'button', value: 'Add new Field' });
        
        form.append(SchemaIDInput);
        form.append(FieldNameeInput);
        SchemaSpan1.append(FieldNameeInput);
        form.append(SchemaSpan1);
        //form.append( FieldTypeInput);
        SchemaSpan2.append($select);
        form.append(SchemaSpan2);
        //form.append($select);
        form.append(submitButton);
        //form.append("<span style='padding:2em;' >" + $('<input>').attr({ type: 'text', name: 'FieldName', placeholder: 'Enter Field Name' }) + "</span>");
        //form.style.display = "block";
        $("#dynamicFormContainer_Edit").append(form);
        //$("#dynamicFormContainer_Edit").style.display = "block";
        //$("#dynamicform").style.display = "block";

        

        submitButton.on("click", function () {
            //alert("You selected: " + $(this).val());
            var form = $("#dynamicform");
            var hdnFieldSchemaID = $('[name="hdnFieldSchemaID"]');
            var txtSchemaID = $('[id="txtSchemaID"]');

            hdnFieldSchemaID.val(txtSchemaID.val());
            var formData = form.serializeArray();
            let schemaFieldid = '';
            let schemaFieldName = '';
            let schemaFieldType = '';

            
            formData.forEach(function (field) {
                if (field.name == 'hdnFieldSchemaID') { schemaFieldid = hdnFieldSchemaID.val() }
                if (field.name == 'FieldName') { schemaFieldName = field.value }
                if (field.name == 'FieldTypeSelect') { schemaFieldType = field.value }
                

            });

            if (schemaFieldName == '') {
                alert("Schema field name should not be blank.");
                return false;
            }
            if (schemaFieldType == '') {
                alert("Pleae select Schema field type");
                return false;
            }
            //alert(schemaFieldid + ": " + schemaFieldName + ": " + schemaFieldType);
            saveSchemaField(schemaFieldid, schemaFieldName, schemaFieldType);
            $("#dynamicform").empty();
            //$("#dynamicFormContainer_Edit").style.display = "none";
            $("#dynamicFormContainer_Edit").css("display", "none");
            return false;
        });


        //alert("btnEditSchemaFields");
        return false;
    });

    function saveSchemaField(schemaId, schemaName, schemaFieldType) {
        //alert(schemaId + schemaName + schemaFieldType);

        $.ajax({
            type: "GET",
            url: "/ContentTree/SaveSchemaField", // PageName/MethodName
            //data: JSON.stringify(requestData),
            data: { SchemaID: schemaId, SchemaName: schemaName, SchemaFieldType: schemaFieldType },
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
               // alert(response.message + " Status is: " + response.status);
               // alert("Total records received: " + response.length);
            },
            error: function (xhr, status, error) {

                console.error("Error occurred:", error);
                //alert("Error occurred:" + error);
            }
        });
    }
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