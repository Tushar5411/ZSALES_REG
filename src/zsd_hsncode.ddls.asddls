@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Hsn Code'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
define root view entity ZSD_HSNCODE 
    as select from I_ProductPlantBasic 
//     LEFT OUTER JOIN i_productplantbasic AS b
//          ON a.product = b.product
//          and b.consumptiontaxctrlcode <> ''
//composition of target_data_source_name as _association_name
       
{
   key Product,
   key Plant,
       ConsumptionTaxCtrlCode
       
       
//    _association_name // Make association public
}
  where ConsumptionTaxCtrlCode <> ''
