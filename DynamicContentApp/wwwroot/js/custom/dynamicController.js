$(document).ready(function () {
    //alert("inside dynamic controler ");

     var dynamiccontrols = $(document).find("[tag='DynamicController']");
      //alert("insidecontrol ");
                    dynamiccontrols.each(function() {
                        //  alert("inside dynamic control ");
                                        var dynamiccontrol = $(this);

                                            var dynamiccontrolid= dynamiccontrol.attr('id');
                                           //  alert(dynamiccontrolid);
                                        // var controlid = control.attr('id');
                                         var controlPrimaryID = dynamiccontrolid+"_PRIMARY"
                                         var controlSecondaryID= dynamiccontrolid+"_SECONDARY"

                                          var dynamicprimarycontrol = dynamiccontrol.find("[id='"+controlPrimaryID+"']");
                                            var dynamicsecondarycontrol = dynamiccontrol.find("[id='"+controlSecondaryID+"']");

                                         var PrimaryDiv = $(dynamicprimarycontrol).attr('id')
                                         // alert(PrimaryDiv);
                                         var SecondaryDiv = $(dynamicsecondarycontrol).attr('id')
                                          //alert(SecondaryDiv);

                                         var endpoint = $(dynamicprimarycontrol).attr("endpoint");
                                         var endpointdatatype = $(dynamicprimarycontrol).attr("endpointdatatype");
                                         var httpmethod = $(dynamicprimarycontrol).attr("httpmethod");
                                         var requestdata = $(dynamicprimarycontrol).attr("requestdata");
                                        // requestdata= {  requestdata };
                                       //  var requestdatanew = JSON.stringify(requestdata)
                                         //alert("endpoint - " + endpoint);
                                         //alert("endpointdatatype - " + endpointdatatype);
                                         //    alert("httpmethod - " + httpmethod);
                                         //alert("requestdata - " + requestdata);  

                                        // *****************************

                                          $.ajax({
                                                         type: httpmethod,
                                                          url:endpoint, 
                                                        // data: JSON.stringify(requestdata),
                                                         data: {SchemaID: requestdata},
                                                        // data:{requestdata },
                                                        // data: { SchemaID: IDSchema },
                                                         contentType: "application/json; charset=utf-8",
                                                         dataType: endpointdatatype,
                                                           async: false,
                                                         success: function (response) {

                                                                 alert("Total records received: " + response.length);
                                                               $.each(response, function(index, record) {
                                                           
                                                                           alert("Record ID: " + record.id);
                                                                            alert("Record SchemaName: " + record.schemaName);
                                                                            alert("Record SchemaPath: " + record.schemaPath);
                                                                            alert("Record ParentID: " + record.parentID);
                                                                             });
                                                                  
                                                              },
                                                          error: function (xhr, status, error) {
                                                         // Code to handle execution errors
                                                                 console.error("Error occurred:", error);
                                                                 // alert("Error occurred:" + error);
                                                             }
                                             });

                                        // *****************************
   
                         });

});
