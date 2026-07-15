

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
    $('#openPopupBtnMasterPage').click(function () {
        $("#lblModelTitle").html('');
        const currenttitle = this.getAttribute('title');
        $("#lblModelTitle").html(currenttitle);
        const parentitem = this.getAttribute('parentitem');
        $("#hdnParentId").val(parentitem);
        // alert($("#" + parentitem).val());
        const parentitemvalue = $("#" + parentitem).val();
        
        $("#txtSelectedItemPath").val(parentitemvalue);

        //const parentitemID = this.getAttribute('parentitemID');
        //const parentitemIDvalue = $("#" + parentitemID).val();
        //$("#txtSelectedItemID").val(parentitemIDvalue);
        $("#txtSelectedItemID").val('');

        

        $("#customModal").show();
        lookupTree('2EB94A78-CC78-4C33-84EA-C2B583A9C8BD', 'PageTemplate');
       // lookupTree('1049D17E-6C1C-45A9-9B75-5F779B61023E');
        /*
        master - 2EB94A78-CC78-4C33-84EA-C2B583A9C8BD
        component - E17E4A01-ECCA-4B9F-886C-7BE198091843
        schema - 1049D17E-6C1C-45A9-9B75-5F779B61023E
        content-D1B2BE76-C76B-447A-A30A-DDDF4959A8FC
        placeholder-8CEE3BBE-195F-416A-A204-1B15BE16AD66
        */
        
        //$('#customModal .modal-content').load('lookupTree #targetElement', function () {
        //    $('#customModal').show();
        //    lookupTree();
        //});

        return false;
    });
    $('#openPopupBtnAssetSchema').click(function () {
        $("#lblModelTitle").html('');
        const currenttitle = this.getAttribute('title');
        $("#lblModelTitle").html(currenttitle);
        const parentitem = this.getAttribute('parentitem');
        $("#hdnParentId").val(parentitem);
        // alert($("#" + parentitem).val());
        const parentitemvalue = $("#" + parentitem).val();
        $("#txtSelectedItemPath").val(parentitemvalue);
        $("#txtSelectedItemID").val('');
        $("#customModal").show();
        lookupTree('1049D17E-6C1C-45A9-9B75-5F779B61023E', 'Schema');
        return false;
    });
    $('#openPopupBtnAssetSchemaAdd').click(function () {
        $("#lblModelTitle").html('');
        const currenttitle = this.getAttribute('title');
        $("#lblModelTitle").html(currenttitle);
        const parentitem = this.getAttribute('parentitem');
        $("#hdnParentId").val(parentitem);
        // alert($("#" + parentitem).val());
        const parentitemvalue = $("#" + parentitem).val();
        $("#txtSelectedItemPath").val(parentitemvalue);
        $("#txtSelectedItemID").val('');
        $("#customModal").show();
        lookupTree('1049D17E-6C1C-45A9-9B75-5F779B61023E', 'Schema');
        return false;
    });
    
       
    $("#closeModalBtn").on("click", function () {
        $("#customModal").hide();
    });
    $("#closeModalBtnSecond").on("click", function () {
        $("#customModal").hide();
    });
    $("#btnSelectedItemPath").on("click", function () {
        const parentitemid = $("#hdnParentId").val();
        const selectedItemPath = $("#txtSelectedItemPath").val();
        $("#" + parentitemid).val(selectedItemPath);
       //alert($("#" + parentitem).val(selectedItemPath));
        $("#hdnParentId").val('');
        $("#customModal").hide();
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

        if (assetItemID == '') {
            alert("AssetItemID   should not be blank.Please select AssetItemID");
            return false;
        }
        //alert(txtSchemaID+ ' '+masterpagePath + ' ' + isItemPageType);
        //if (isItemPageType == '') {
        //    alert("IsItemPageType   should not be blank.Please select IsItemPageType");
        //    return false;
        //}
        if (masterpagePath == '') {
            alert("Masterpage Path  should not be blank. Please enter Masterpage Path");
            return false;
        }
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

//function getAssetMasterLayoutDetails(assetItemID) {
//    //alert(assetItemID + ' ' + isItemPageType + ' ' + masterpagePath );

//    $.ajax({
//        type: "GET",
//        url: "/ContentTree/GetAssetMasterLayoutDetails", // PageName/MethodName
//        //data: JSON.stringify(requestData),
//        data: { AssetItemID: assetItemID },
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (response) {
//            var RecordCount = response.length;
//            alert("Total records received: " + RecordCount);
//            $.each(response, function (index, record) {
//                alert(record.masterpagePath + ' ' + record.isItemPageType);
//                //$("#masterPageDiv #txtSchemaID").val(record.assetItemID);
//                $("#masterPageDiv #chkIsItemPageType").val(record.isItemPageType);
//                $("#masterPageDiv #txtMasterPageItem").val(record.masterpagePath);
//            });

//        },
//        error: function (xhr, status, error) {

//            console.error("Error occurred:", error);
//            //alert("Error occurred:" + error);
//        }
//    });
//}

function lookupTree(IDSchema1, rootItemText) {
        //alert("inside lookup");
    //var IDSchema1 = "lup_1049D17E-6C1C-45A9-9B75-5F779B61023E";

   // const myUL1Div = $('#myUL1h1').innerHTML="Category heading";
    var IDSchema2 = "lup_" + IDSchema1;
    const ul = document.getElementById('myUL1');
    ul.innerHTML = '';
    ul.innerHTML = "<li tag='" + IDSchema1 + "'><span id='" + IDSchema1 + "' tag='" + IDSchema1 + "' class='caret_lup default-color'>" +rootItemText+"</span><ul id='" + IDSchema2 +"' class='nested' ></ul></li>";

  
    //alert(IDSchema1);
    var childChildCountarr = [];
    getDbData1(IDSchema2);
        //ViewContentItem1(IDSchema1.replace('lup_','') );
       // alert("befor lookup tree" + IDSchema1);
       // if (IDSchema1 = "lup_1049D17E-6C1C-45A9-9B75-5F779B61023E") {
            //alert("lookup tree" + IDSchema1);
            var toggler = document.getElementsByClassName("caret_lup");
            var i;
                    for (i = 0; i < toggler.length; i++) {
                        toggler[i].addEventListener("click", function (e) {
                            this.parentElement.querySelector(".nested").classList.toggle("active");
                            this.classList.toggle("caret_lup-down");
                            const idSchema = this.getAttribute('id');
                    

                            const allchildLi = this.parentElement.querySelectorAll('ul li');

                            allchildLi.forEach(span => {
                                span.remove();
                            });
                           // alert("lookup tree" + idSchema);
                            getDbData1('lup_'+ idSchema);
                            const spans = document.querySelectorAll('span.highlight');
                            spans.forEach(span => {
                                span.classList.remove('highlight');
                            });
                            this.classList.toggle("highlight");
                            //const spans1 = document.querySelectorAll('span.highlight');
                            //spans1.forEach(span => {
                            //    setupcontextmenu(this);

                            //});
                            ViewContentItem1(idSchema);

                        });
                    }

           // }

    }


    function getDbData1( IDSchema ) {

        //alert(getDbData1);
        IDSchema2 = IDSchema.replace('lup_', '');
         var requestData1 = {
                     SchemaID: IDSchema
                         };
        //alert('IDSchema ' + ' ' + IDSchema2);
        $.ajax({
            type: "GET",
        url: "/ContentTree/GetChildSchema",
        data: {SchemaID: IDSchema2 },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
            success: function (response) {
            console.log("Success:", response);
                         if(response.length>0)
                        {
                            //alert('response length  ' +response.length);
                            $.each(response, function (index, record) {
                                checkChildCount1(record.childSchemaID);
                                var childhiddenCount = $("#hdnChildCount1").val();
                                var myUl1 = $("#myUL1").find("ul[id='" + IDSchema + "']");
                               //alert(IDSchema);
                                //var myUl1 = $(IDSchema1)

                                //alert('myUl1  ' +myUl1.html());
                                if (parseInt(childhiddenCount) > 0) {
                                    myUl1.append("<li><span  onclick=GetChildOfSelectedUL1('lup_" + record.childSchemaID + "'); tag='" + record.childSchemaID + "' id='lup_" + record.childSchemaID + "' class='caret default-color'>" + record.childSchemaName + "</span><ul id='lup_" + record.childSchemaID + "'  tag='" + record.childSchemaID + "' class='nested'><li></li></ul></li>");
                                   //alert("inside myUl1 parent");
                                }
                                else {
                                    myUl1.append("<li><span id='lup_" + record.childSchemaID + "' tag='" + record.childSchemaID + "' onclick=GetChildOfSelectedLI1('lup_" + record.childSchemaID + "'); class='caretli'>" + record.childSchemaName + "</span></li>");
                                   //alert("inside myUl1 child");
                                 }
                             });

                         }
                     },
                error: function (xhr, status, error) {
                                    console.error("Error occurred:", error);
                                        }
            });
        }
    

    function checkChildCount1( IDSchema ) {
             //alert('checkChildCount1 ' +' '+IDSchema);
            var childCount= 0;
    var requestData = {
        SchemaID: IDSchema
                         };
    $.ajax({
        type: "GET",
    url: "/ContentTree/GetChildSchema",
    data: {SchemaID: IDSchema },
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: false,
    success: function (response) {
                         if(response.length>0)
    {
        $("#hdnChildCount1").val(response.length);
                             //alert('children count length greater' +$("#hdnChildCount1").val()+ ' '+ response.length);
                         }
    else
    {
        $("#hdnChildCount1").val("0");
                                //alert('children count length greater' +$("#hdnChildCount1").val()+ ' '+ response.length);
                         }
                     },
    error: function (xhr, status, error) {
        console.error("Error occurred:", error);
                    }
            });
             

        }






    function  GetChildOfSelectedLI1(childSchemaID) {
        //alert('GetChildOfSelectedLI' + ' ' + childSchemaID);
    addEventListener_caretli1(childSchemaID)
    ViewContentItem1(childSchemaID) ;

    };


    function getSchema1( IDSchema ) {
        //alert('getSchema1' + ' ' + IDSchema);
    $.ajax({
        type: "GET",
    url: "/ContentTree/GetSchema", // PageName/MethodName
    //data: JSON.stringify(requestData),
    data: {SchemaID: IDSchema },
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: false,
    success: function (response) {
        $.each(response, function (index, record) {
           //alert('getSchema1' + ' ' + record.schemaPath);
            $("#txtSelectedItemPath").val(record.schemaPath);
            $("#txtSelectedItemID").val(record.id);
        });
                      },
    error: function (xhr, status, error) {
        console.error("Error occurred:", error);
                     }
             });
                        // var  AssetItemID = $("#editSchemaForm #txtSchemaID").val();
                        // var  AssetItemSchemaID = $("#editSchemaForm #txtAssetItemSchema").val();
                        //  var  AssetItemTreeeID = $("#editSchemaForm #txtAssetItemTreeeID").val();

                       // ViewContentDetailItem( AssetItemID, AssetItemSchemaID,AssetItemTreeeID);

         }




    function  GetChildOfSelectedUL1(childSchemaID) {
        //alert('GetChildOfSelectedUL1' + ' ' + childSchemaID);
       
    getDbData1( childSchemaID );
    addEventListener_caret1(childSchemaID);
    ViewContentItem1(childSchemaID) ;
    };



function addEventListener_caret1(childSchemaID) {
    //alert('addEventListener_caret1' + ' ' + childSchemaID);
    //childSchemaID1 = 'lup_'+ childSchemaID;
    var toggler = document.getElementById(childSchemaID);
    //alert('addEventListener_caret1 toggler' + ' ' + toggler);
   // alert('addEventListener_caret1 toggler.parentElement' + ' ' + toggler.parentElement);
    // const contextMenu = document.getElementById("contextMenu");
    //const editdiv = document.getElementById("editdiv");
    //const removediv = document.getElementById("removediv");
    var i;
    toggler.parentElement.querySelector(".nested").classList.toggle("active");
    toggler.classList.toggle("caret_lup-down");
    const idSchema = toggler.getAttribute('id');
    //alert('addEventListener_caret1_idSchema' + ' ' + idSchema);
    const allchildLi = toggler.parentElement.querySelectorAll('ul li');


               allchildLi.forEach(span => {
        span.remove();
               });
                
    getDbData1(childSchemaID);
    const spans = document.querySelectorAll('span.highlight');
                spans.forEach(span => {
        span.classList.remove('highlight');
                });
    if (toggler) {
        toggler.classList.add('highlight');
                      //setupcontextmenu(toggler);
                    }


     }
    function ViewContentItem1( currentitemid) {
           
                              var content=$("#" +currentitemid).html();
        //alert(content + ' ' + currentitemid);
        currentitemid = currentitemid.replace('lup_', '');
        //alert(content + ' ' + currentitemid);
    getSchema1( currentitemid );
                                  // var assetid = $("#editSchemaForm #txtSchemaID").val();

               }

function addEventListener_caretli1(childSchemaID) {
    //alert('addEventListener_caretli1' + ' ' + childSchemaID);
         // e.preventDefault();
         //e.stopPropagation();
          var togglerli = document.getElementById(childSchemaID);

          //alert(togglerli.getAttribute("id"));
       // var j;

      //  for (j = 0; j < togglerli.length; j++) {
            //togglerli.addEventListener("click", function () {
               // alert('inside caretli')
                //this.parentElement.querySelector(".nested").classList.toggle("active");
                //this.classList.toggle("caret-down");
                const spans = document.querySelectorAll('span.highlight');
                // 2. Loop through each span and remove the class
                spans.forEach(span => {
        span.classList.remove('highlight');
                });

    //togglerli.classList.toggle("highlight");
    if (togglerli) {
        // alert(togglerli.getAttribute("id"));
        togglerli.classList.add('highlight');
                    }

    //setupcontextmenu(togglerli);

    return;

     }


