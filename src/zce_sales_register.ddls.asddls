    @ObjectModel: {
    query: {
       implementedBy: 'ABAP:ZCL_SALES_REGISTER'
    }
}

@UI.headerInfo: { typeName: 'Sales Register' ,
                  typeNamePlural: 'Sales Register' }


@EndUserText.label: 'Sales Register'
define custom entity ZCE_SALES_REGISTER
{

      @UI.facet                    : [{ id : 'Vbeln',
                purpose            : #STANDARD,
                type               : #IDENTIFICATION_REFERENCE,
                label              : 'Sales Register',
                position           : 10 },

                { id               : 'fkdat',
                purpose            : #STANDARD,
                type               : #IDENTIFICATION_REFERENCE,
                label              : 'Billing Date',
                position           : 20 },

                 { id              : 'bukrs',
                purpose            : #STANDARD,
                type               : #IDENTIFICATION_REFERENCE,
                label              : 'Company Code',
                position           : 30 }
                ]



      @UI.selectionField           : [{position: 10 }]
      @UI.lineItem                 : [{label: 'Billing Date', position: 10 ,importance: #HIGH }]
      @UI.identification           : [{ position: 10 }]
  key fkdat                        : datum;

      @UI.selectionField           : [{position: 20 }]
      @UI.lineItem                 : [{label: 'Company Code', position: 20 ,importance: #HIGH }]
      @UI.identification           : [{ position: 20 }]
  key bukrs                        : bukrs;

      @UI.selectionField           : [{position: 30 }]
      @UI.lineItem                 : [{label: 'Sold To Party', position: 30 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Sold To Party', position: 30 }]
      @Consumption.valueHelpDefinition: [{ entity: {  name: 'I_Customer' ,element: 'Customer' } }]
  key sold_to                      : kunnr;

      @UI.lineItem                 : [{label: 'Sold To Party Name', position: 40 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Sold To Party Name', position: 40 }]
  key sold_to_nm                   : abap.char(40);

      @UI.selectionField           : [{position: 50 }]
      @UI.lineItem                 : [{label: 'Plant', position: 50 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Plant', position: 50 }]
  key werks                        : werks_d;

      @UI.selectionField           : [{ position: 60 }]
      @UI.lineItem                 : [{label: 'Billing Doc', position: 60 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Billing Doc', position: 60 }]
      @Consumption.valueHelpDefinition: [{ entity: {  name: 'I_BillingDocument' ,element: 'BillingDocument' } }]
  key vbeln                        : vbeln;

      @UI.selectionField           : [{position: 70 }]
      @UI.lineItem                 : [{label: 'Billing Type', position: 70 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Billing Type', position: 70 }]
  key fkart                        : fkart;

      @UI.lineItem                 : [{label: 'Billing Item', position: 80 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Billing Item', position: 80 }]
      posnr                        : posnr;

      @UI.lineItem                 : [{label: 'Delivery No', position: 90 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Delivery No', position: 90 }]
      vbeln_d                      : vbeln;

      @UI.lineItem                 : [{label: 'Delivery Item', position: 100 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Delivery Item', position: 100 }]
      posnr_d                      : posnr;

      @UI.lineItem                 : [{label: 'SO No', position: 110 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'SO No', position: 110 }]
      vbeln_s                      : vbeln;

      @UI.lineItem                 : [{label: 'SO Item', position: 120 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'SO Item', position: 120 }]
      posnr_s                      : posnr;

      @UI.lineItem                 : [{label: 'Ship To Party', position: 130 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Ship To Party', position: 130 }]
      shipto                       : kunnr;

      @UI.lineItem                 : [{label: 'Ship To Party Name', position: 140 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Ship To Party Name', position: 140 }]
      shiptonm                     : abap.char(40);

      @UI.lineItem                 : [{label: 'Bill To Party', position: 150 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Bill To Party', position: 150 }]
      billto                       : kunnr;

      @UI.lineItem                 : [{label: 'Bill To Party Name', position: 160 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Bill To Party Name', position: 160 }]
      billtonm                     : abap.char(40);

      @UI.lineItem                 : [{label: 'Payer', position: 170 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Payer', position: 170 }]
      payer                        : kunnr;

      @UI.lineItem                 : [{label: 'Payer Name', position: 180 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Payer Name', position: 180 }]
      payernm                      : abap.char(40);

      @UI.lineItem                 : [{label: 'GSTIN', position: 190 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'GSTIN', position: 190 }]
      gstin                        : stcd3;

      @UI.lineItem                 : [{label: 'Material Code', position: 200 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Material Code', position: 200 }]
      matnr                        : matnr;

      @UI.lineItem                 : [{label: 'Material Description', position: 210 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Material Description', position: 210 }]
      maktx                        : maktx;

      @UI.lineItem                 : [{label: 'Material Grp', position: 220 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Material Grp', position: 220 }]
      MATERIALGROUP                : abap.char(20);

//      @UI.lineItem                 : [{label: 'HSN Code', position: 170 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'HSN COde', position: 170 }]
//      STEUC                        : abap.char(20);

      // @UI.hidden: true
      @UI.lineItem                 : [{label: 'UoM', position: 230 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'UoM', position: 230 }]
      uom                          : meins;

      @UI.lineItem                 : [{label: 'Billing Qty', position: 240 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Billing Qty', position: 240 }]
      @Semantics.quantity.unitOfMeasure : 'uom'
      fkimg                        : menge_d;

      @UI.lineItem                 : [{label: 'Currency', position: 250 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Currency', position: 250 }]
      // @UI.hidden: true
      currency                     : waers;

      @UI.lineItem                 : [{label: 'Exchange Rate', position: 260 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Exchange rate', position: 260 }]
      // @UI.hidden: true
      //  @Semantics.amount.currencyCode : 'currency'
      KURRF                        : abap.char(20);

      @UI.lineItem                 : [{label: 'Rate', position: 270 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Rate', position: 270 }]
      @Semantics.amount.currencyCode : 'currency'
      rate                         : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'Net Value', position: 280 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Net Valye', position: 280 }]
      @Semantics.amount.currencyCode : 'currency'
      netvalue                     : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'Tax', position: 290 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Tax', position: 290 }]
      @Semantics.amount.currencyCode : 'currency'
      tax                          : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'Insurance', position: 300 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Insurance', position: 300 }]
      @Semantics.amount.currencyCode : 'currency'
      insurance                    : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'Freight', position: 310 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Freight', position: 310 }]
      @Semantics.amount.currencyCode : 'currency'
      freight                      : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'Total Value', position: 320 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Total Value', position: 320 }]
      @Semantics.amount.currencyCode : 'currency'
      totalvalue                   : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'CGST %', position: 330 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'CGST %', position: 330 }]
      @Semantics.amount.currencyCode : 'currency'
      cgstperc                     : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'CGST Value', position: 340 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'CGST Value', position: 340 }]
      @Semantics.amount.currencyCode : 'currency'
      cgstvalue                    : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'SGST %', position: 350 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'SGST %', position: 350 }]
      @Semantics.amount.currencyCode : 'currency'
      sgstperc                     : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'SGST Value', position: 360 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'SGST Value', position: 360 }]
      @Semantics.amount.currencyCode : 'currency'
      sgstvalue                    : abap.curr(10,2);


      @UI.lineItem                 : [{label: 'UGST %', position: 370 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'UGST %', position: 370 }]
      @Semantics.amount.currencyCode : 'currency'
      ugstperc                     : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'UGST Value', position: 380 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'UGST Value', position: 380 }]
      @Semantics.amount.currencyCode : 'currency'
      ugstvalue                    : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'IGST %', position: 390 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'IGST %', position: 390 }]
      @Semantics.amount.currencyCode : 'currency'
      igstperc                     : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'IGST Value', position: 400 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'IGST Value', position: 400 }]
      @Semantics.amount.currencyCode : 'currency'
      igstvalue                    : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'TCS Value', position: 410 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'TCS Value', position: 410 }]
      @Semantics.amount.currencyCode : 'currency'
      tcsvalue                     : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'RoundOff', position: 420 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'RoundOff', position: 420 }]
      @Semantics.amount.currencyCode : 'currency'
      roundoff                     : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'Profit center', position: 430 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Profit center', position: 430 }]
      PROFITCENTER                 : abap.char(20);

      @UI.lineItem                 : [{label: 'Cocd Currency', position: 430 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Cocd Currency', position: 430 }]
      @UI.hidden                   : true
      companycodecurrency          : waers;

      @UI.lineItem                 : [{label: 'Amount in INR', position: 440 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Amount in INR', position: 440 }]
      @Semantics.amount.currencyCode : 'companycodecurrency'
      amt_inr                      : abap.curr(10,2);

      @UI.lineItem                 : [{label: 'G/L Account', position: 450 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'G/L Account', position: 450 }]
      glacct                       : abap.char(20);

      @UI.lineItem                 : [{label: 'G/L Account name', position: 460 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'G/L Account name', position: 460 }]
      glacct_nm                    : abap.char(20);

      @UI.lineItem                 : [{label: 'Sales organization', position: 470 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Sales org', position: 470 }]
      salesorganization            : abap.char(4);

      @UI.lineItem                 : [{label: 'Distribution channel', position: 480 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Distribution channel', position: 480 }]
      DISTRIBUTIONCHANNEL          : abap.char(4);

      @UI.lineItem                 : [{label: 'Division', position: 490 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Division', position: 490 }]
      DIVISION                     : abap.char(3);

      @UI.lineItem                 : [{label: 'Customer group', position: 500 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Customer group', position: 500 }]
      customergroup                : abap.char(10);

      @UI.lineItem                 : [{label: 'Destination country', position: 510 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Sales org', position: 510 }]
      country                      : abap.char(4);

      @UI.lineItem                 : [{label: 'Incoterms', position: 520 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Incoterms', position: 520 }]
      incotermsclassification      : abap.char(4);

      @UI.lineItem                 : [{label: 'Payment terms', position: 530 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Payment terms', position: 530 }]
      customerpaymentterms         : abap.char(10);

      @UI.lineItem                 : [{label: 'Region', position: 540 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Region', position: 540 }]
      region                       : abap.char(20);

      @UI.lineItem                 : [{ label: 'Advance License', position: 550, importance: #HIGH }]
      @UI.identification           : [{ label: 'Advance License', position: 550 }]
      yy1_advancelicense_bdh       : abap.char(50);

      @UI.lineItem                 : [{ label: 'Bank Ref No', position: 560, importance: #HIGH }]
      @UI.identification           : [{ label: 'Bank Ref No', position: 560 }]
      yy1_bankrefno_bdh            : abap.char(50);

      @UI.lineItem                 : [{ label: 'Bond or LUT', position: 570, importance: #HIGH }]
      @UI.identification           : [{ label: 'Bond or LUT', position: 570 }]
      yy1_bondorlut_bdh            : abap.char(50);

      @UI.lineItem                 : [{ label: 'BRC No', position: 580, importance: #HIGH }]
      @UI.identification           : [{ label: 'BRC No', position: 580 }]
      yy1_brcno_bdh                : abap.char(50);

      @UI.lineItem                 : [{ label: 'DBK Scroll Date', position: 590, importance: #HIGH }]
      @UI.identification           : [{ label: 'DBK Scroll Date', position: 590 }]
      yy1_dbkscrolldate_bdh        : abap.dats;

      @UI.lineItem                 : [{ label: 'DBK Scroll No', position: 600, importance: #HIGH }]
      @UI.identification           : [{ label: 'DBK Scroll No', position: 600 }]
      yy1_dbkscrollno_bdh          : abap.char(50);

      @UI.lineItem                 : [{ label: 'Duty Drawback', position: 610, importance: #HIGH }]
      @UI.identification           : [{ label: 'Duty Drawback', position: 610 }]
      yy1_dutydrawback_bdh         : abap.char(50);

      @UI.lineItem                 : [{ label: 'EPCG', position: 620, importance: #HIGH }]
      @UI.identification           : [{ label: 'EPCG', position: 620 }]
      yy1_epcg_bdh                 : abap.char(50);

      @UI.lineItem                 : [{ label: 'Lodge No', position: 630, importance: #HIGH }]
      @UI.identification           : [{ label: 'Lodge No', position: 630 }]
      yy1_lodgeno_bdh              : abap.char(50);

      @UI.lineItem                 : [{ label: 'LUT No 2', position: 640, importance: #HIGH }]
      @UI.identification           : [{ label: 'LUT No 2', position: 640 }]
      yy1_lutno2_bdh               : abap.char(50);

      @UI.lineItem                 : [{ label: 'RBI Ref No', position: 650, importance: #HIGH }]
      @UI.identification           : [{ label: 'RBI Ref No', position: 650 }]
      yy1_rbirefno_bdh             : abap.char(50);

      @UI.lineItem                 : [{ label: 'RODTEP', position: 660, importance: #HIGH }]
      @UI.identification           : [{ label: 'RODTEP', position: 660 }]
      yy1_rodtep_bdh               : abap.char(50);

      @UI.lineItem                 : [{ label: 'RODTEP Scroll Date', position: 670, importance: #HIGH }]
      @UI.identification           : [{ label: 'RODTEP Scroll Date', position: 670 }]
      yy1_rodtepscrolldate_bdh     : abap.dats;

      @UI.lineItem                 : [{ label: 'RODTEP Scroll No', position: 680, importance: #HIGH }]
      @UI.identification           : [{ label: 'RODTEP Scroll No', position: 680 }]
      yy1_rodtepscrollno_bdh       : abap.char(50);

      @UI.lineItem                 : [{ label: 'Shipper Seal No 1', position: 690, importance: #HIGH }]
      @UI.identification           : [{ label: 'Shipper Seal No 1', position: 690 }]
      yy1_shippersealno1_bdh       : abap.char(50);

      @UI.lineItem                 : [{ label: 'Shipping Bill Date', position: 700, importance: #HIGH }]
      @UI.identification           : [{ label: 'Shipping Bill Date', position: 700 }]
      yy1_shippingbilldate_bdh     : abap.dats;

      @UI.lineItem                 : [{ label: 'Shipping Bill Exch. Rate', position: 710, importance: #HIGH }]
      @UI.identification           : [{ label: 'Shipping Bill Exch. Rate', position: 710 }]
      @Semantics.amount.currencyCode : 'companycodecurrency'
      yy1_shippingbillexchan_bdh   : abap.curr(10,2);

      @UI.lineItem                 : [{ label: 'Shipping Bill No', position: 720, importance: #HIGH }]
      @UI.identification           : [{ label: 'Shipping Bill No', position: 720 }]
      yy1_shippingbillno_bdh       : abap.char(50);

      @UI.lineItem                 : [{ label: 'LR Date', position: 730, importance: #HIGH }]
      @UI.identification           : [{ label: 'LR Date', position: 730 }]
      yy1_lrdate_bdh               : abap.dats;

      @UI.lineItem                 : [{ label: 'LR No', position: 740, importance: #HIGH }]
      @UI.identification           : [{ label: 'LR No', position: 740 }]
      yy1_lrno_bdh                 : abap.char(50);

      @UI.lineItem                 : [{ label: 'Seal No 1', position: 750, importance: #HIGH }]
      @UI.identification           : [{ label: 'Seal No 1', position: 750 }]
      yy1_sealno1_bdh              : abap.char(50);

      @UI.lineItem                 : [{ label: 'Vessel No', position: 760, importance: #HIGH }]
      @UI.identification           : [{ label: 'Vessel No', position: 760 }]
      yy1_vesselno_bdh             : abap.char(50);

      @UI.lineItem                 : [{ label: 'Customer search term', position: 770, importance: #HIGH }]
      @UI.identification           : [{ label: 'Customer search term', position: 770 }]
      sortfield                    : abap.char(50);

      @UI.lineItem                 : [{ label: 'Actual freight', position: 780, importance: #HIGH }]
      @UI.identification           : [{ label: 'Actual freight', position: 780 }]
      yy1_actualfreight_bdh        : abap.char(20);

      @UI.lineItem                 : [{ label: 'Container no', position: 790, importance: #HIGH }]
      @UI.identification           : [{ label: 'Container no', position: 790 }]
      yy1_containerno1_bdh         : abap.char(50);

      @UI.lineItem                 : [{ label: 'Container size', position: 800, importance: #HIGH }]
      @UI.identification           : [{ label: 'Container size', position: 800 }]
      yy1_containersize_bdh        : abap.char(20);

      @UI.lineItem                 : [{ label: 'Let Export date', position: 810, importance: #HIGH }]
      @UI.identification           : [{ label: 'Let Export date', position: 810 }]
      yy1_letexportdate_bdh        : abap.dats;

      @UI.lineItem                 : [{ label: 'Leo date', position: 820, importance: #HIGH }]
      @UI.identification           : [{ label: 'Leo date', position: 820 }]
      yy1_leodate_bdh              : abap.dats;

      @UI.lineItem                 : [{ label: 'Vehicle no', position: 830, importance: #HIGH }]
      @UI.identification           : [{ label: 'Vehicle no', position: 830 }]
      YY1_VehicleNo2_BDH           : abap.char(50);

      @UI.lineItem                 : [{ label: 'Vehicle type', position: 840, importance: #HIGH }]
      @UI.identification           : [{ label: 'Vehicle type', position: 840 }]
      YY1_VehicleType_BDH          : abap.char(20);

      @UI.lineItem                 : [{label: 'Credit amount', position: 850 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Credit amount', position: 850 }]
      @Semantics.amount.currencyCode : 'companycodecurrency'
      creditamt                    : abap.curr(10,2);

      @UI.lineItem                 : [{ label: 'Journal entry no', position: 860, importance: #HIGH }]
      @UI.identification           : [{ label: 'Journal entry no', position: 860 }]
      journalentry_no              : abap.char(20);

      @UI.lineItem                 : [{ label: 'Jounral entry date', position: 870, importance: #HIGH }]
      @UI.identification           : [{ label: 'Jounral entry date', position: 870 }]
      postingdate                  : abap.dats;

      @UI.lineItem                 : [{ label: 'Material by Customer', position: 880, importance: #HIGH }]
      @UI.identification           : [{ label: 'Material by Customer', position: 880 }]
      materialbycustomer           : abap.char(35);

      @UI.lineItem                 : [{ label: 'Customer PO Supplement', position: 890, importance: #HIGH }]
      @UI.identification           : [{ label: 'Customer PO Supplement', position: 890 }]
      CustomerPurchaseOrderSuplmnt : abap.char(35);

      @UI.lineItem                 : [{ label: 'Customer PO Date', position: 900, importance: #HIGH }]
      @UI.identification           : [{ label: 'Customer PO Date', position: 900 }]
      CustomerPurchaseOrderDate    : abap.dats;

      @UI.lineItem                 : [{ label: 'Group BP Name 1', position: 910, importance: #HIGH }]
      @UI.identification           : [{ label: 'Group BP Name 1', position: 910 }]
      groupbusinesspartnername1    : abap.char(40);

      @UI.lineItem                 : [{ label: 'Group BP Name 2', position: 920, importance: #HIGH }]
      @UI.identification           : [{ label: 'Group BP Name 2', position: 920 }]
      groupbusinesspartnername2    : abap.char(40);

      @UI.lineItem                 : [{ label: 'Discount Amount', position: 930, importance: #HIGH }]
      @UI.identification           : [{ label: 'Discount Amount', position: 930 }]
      @Semantics.amount.currencyCode : 'currency'
      discount                     : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Discount Percentage', position: 940, importance: #HIGH }]
      @UI.identification           : [{ label: 'Discount Percentage', position: 940 }]
      @Semantics.amount.currencyCode : 'currency'
      discount_per                 : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Free of Charge Amount', position: 950, importance: #HIGH }]
      @UI.identification           : [{ label: 'Free of Charge Amount', position: 950 }]
      @Semantics.amount.currencyCode : 'currency'
      freeofcharge                 : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Free of Charge Percentage', position: 960, importance: #HIGH }]
      @UI.identification           : [{ label: 'Free of Charge Percentage', position: 960 }]
      @Semantics.amount.currencyCode : 'currency'
      freeofcharge_per             : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Freight Discount Amount', position: 970, importance: #HIGH }]
      @UI.identification           : [{ label: 'Freight Discount Amount', position: 970 }]
      @Semantics.amount.currencyCode : 'currency'
      freightdiscount              : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Freight Discount Percentage', position: 980, importance: #HIGH }]
      @UI.identification           : [{ label: 'Freight Discount Percentage', position: 980 }]
      @Semantics.amount.currencyCode : 'currency'
      freightdiscount_per          : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Price Adjustment Amount', position: 990, importance: #HIGH }]
      @UI.identification           : [{ label: 'Price Adjustment Amount', position: 990 }]
      @Semantics.amount.currencyCode : 'currency'
      priceadjustment              : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Price Adjustment Percentage', position: 1000, importance: #HIGH }]
      @UI.identification           : [{ label: 'Price Adjustment Percentage', position: 1000 }]
      @Semantics.amount.currencyCode : 'currency'
      priceadjustment_per          : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Value Adjustment Amount', position: 1010, importance: #HIGH }]
      @UI.identification           : [{ label: 'Value Adjustment Amount', position: 1010 }]
      @Semantics.amount.currencyCode : 'currency'
      valueadjustment              : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Value Adjustment Percentage', position: 1020, importance: #HIGH }]
      @UI.identification           : [{ label: 'Value Adjustment Percentage', position: 1020 }]
      @Semantics.amount.currencyCode : 'currency'
      valueadjustment_per          : abap.curr(16,2);

      @UI.lineItem                 : [{ label: 'Old product id', position: 1030, importance: #HIGH }]
      @UI.identification           : [{ label: 'Old product id', position: 1030 }]
      productoldid                 : abap.char(20);

      @UI.lineItem                 : [{label: 'cgst Stat', position: 1040 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'cgst Stat', position: 1040 }]
      cgst_stat                    : abap.char(1);

      @UI.lineItem                 : [{label: 'sgst Stat', position: 1050 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'sgst Stat', position: 1050 }]
      sgst_stat                    : abap.char(1);

      @UI.lineItem                 : [{label: 'ugst Stat', position: 1060 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'ugst Stat', position: 1060 }]
      ugst_stat                    : abap.char(1);

      @UI.lineItem                 : [{label: 'igst Stat', position: 1070 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'igst Stat', position: 1070 }]
      igst_stat                    : abap.char(1);

      @UI.lineItem                 : [{label: 'JTC Stat', position: 1080 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'JTC Stat', position: 1080 }]
      jtc_stat                     : abap.char(1);

      @UI.lineItem                 : [{label: 'Roundoff Stat', position: 1090 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Roundoff Stat', position: 1090 }]
      roundoff_stat                : abap.char(1);

      @UI.lineItem                 : [{label: 'Insurance Stat', position: 1100 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'igst Stat', position: 1100 }]
      zins_stat                    : abap.char(1);

      @UI.lineItem                 : [{label: 'Freight Stat', position: 1110 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Freight Stat', position: 1110 }]
      freight_stat                 : abap.char(1);

      @UI.lineItem                 : [{label: 'Discount Stat', position: 1120 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Discount Stat', position: 1120 }]
      discount_stat                : abap.char(1);

      @UI.lineItem                 : [{label: 'Freeofcharge Stat', position: 1130 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Freeofcharge Stat', position: 1130 }]
      foc_stat                     : abap.char(1);

      @UI.lineItem                 : [{label: 'Frt discount Stat', position: 1140 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Frt discount Stat', position: 1140 }]
      frt_discount_stat            : abap.char(1);

      @UI.lineItem                 : [{label: 'Price adjust Stat', position: 1150 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Price adjust Stat', position: 1150 }]
      prc_adjust_stat              : abap.char(1);

      @UI.lineItem                 : [{label: 'Val adjust Stat', position: 1160 ,importance: #HIGH }]
      @UI.identification           : [{ label: 'Val adjust Stat', position: 1160 }]
      val_adjust_stat              : abap.char(1);

      @UI.lineItem                 : [{ label: 'hsncode', position: 1170, importance: #HIGH }]
      @UI.identification           : [{ label: 'hsncode', position: 1170 }]
//      HSNCODE                      : abap.char(50);
      consumptiontaxctrlcode       : abap.char(50);

      @UI.lineItem                 : [{ label: 'custom_hsn', position: 1180, importance: #HIGH }]
      @UI.identification           : [{ label: 'custom_hsn', position: 1180 }]
      custom_hsn                   : abap.char(50);

      @UI.lineItem                 : [{ label: 'CI hsn', position: 1190, importance: #HIGH }]
      @UI.identification           : [{ label: 'CI hsn', position: 1190 }]
      ci_hsn                       : abap.char(50);



////""""""""" PRD Backup 

//      @UI.selectionField           : [{position: 10 }]
//      @UI.lineItem                 : [{label: 'Billing Date', position: 10 ,importance: #HIGH }]
//      @UI.identification           : [{ position: 10 }]
//  key fkdat                        : datum;
//
//      @UI.selectionField           : [{position: 20 }]
//      @UI.lineItem                 : [{label: 'Company Code', position: 20 ,importance: #HIGH }]
//      @UI.identification           : [{ position: 20 }]
//  key bukrs                        : bukrs;
//
//      @UI.selectionField           : [{position: 30 }]
//      @UI.lineItem                 : [{label: 'Sold To Party', position: 30 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Sold To Party', position: 30 }]
//      @Consumption.valueHelpDefinition: [{ entity: {  name: 'I_Customer' ,element: 'Customer' } }]
//  key sold_to                      : kunnr;
//
//      @UI.lineItem                 : [{label: 'Sold To Party Name', position: 35 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Sold To Party Name', position: 35 }]
//  key sold_to_nm                   : abap.char(40);
//
//      @UI.selectionField           : [{position: 40 }]
//      @UI.lineItem                 : [{label: 'Plant', position: 40 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Plant', position: 40 }]
//  key werks                        : werks_d;
//
//      @UI.selectionField           : [{ position: 50 }]
//      @UI.lineItem                 : [{label: 'Billing Doc', position: 50 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Billing Doc', position: 50 }]
//      @Consumption.valueHelpDefinition: [{ entity: {  name: 'I_BillingDocument' ,element: 'BillingDocument' } }]
//  key vbeln                        : vbeln;
//
//      @UI.selectionField           : [{position: 60 }]
//      @UI.lineItem                 : [{label: 'Billing Type', position: 60 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Billing Type', position: 60 }]
//  key fkart                        : fkart;
//
//      @UI.lineItem                 : [{label: 'Billing Item', position: 70 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Billing Item', position: 70 }]
//      posnr                        : posnr;
//
//      @UI.lineItem                 : [{label: 'Delivery No', position: 80 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Delivery No', position: 80 }]
//      vbeln_d                      : vbeln;
//
//      @UI.lineItem                 : [{label: 'Delivery Item', position: 90 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Delivery Item', position: 90 }]
//      posnr_d                      : posnr;
//
//      @UI.lineItem                 : [{label: 'SO No', position: 100 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'SO No', position: 100 }]
//      vbeln_s                      : vbeln;
//
//      @UI.lineItem                 : [{label: 'SO Item', position: 110 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'SO Item', position: 110 }]
//      posnr_s                      : posnr;
//
//      @UI.lineItem                 : [{label: 'Ship To Party', position: 120 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Ship To Party', position: 120 }]
//      shipto                       : kunnr;
//
//      @UI.lineItem                 : [{label: 'Ship To Party Name', position: 125 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Ship To Party Name', position: 125 }]
//      shiptonm                     : abap.char(40);
//
//      @UI.lineItem                 : [{label: 'Bill To Party', position: 130 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Bill To Party', position: 130 }]
//      billto                       : kunnr;
//
//      @UI.lineItem                 : [{label: 'Bill To Party Name', position: 135 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Bill To Party Name', position: 135 }]
//      billtonm                     : abap.char(40);
//
//      @UI.lineItem                 : [{label: 'Payer', position: 140 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Payer', position: 140 }]
//      payer                        : kunnr;
//
//      @UI.lineItem                 : [{label: 'Payer Name', position: 145 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Payer Name', position: 145 }]
//      payernm                      : abap.char(40);
//
//      @UI.lineItem                 : [{label: 'GSTIN', position: 150 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'GSTIN', position: 150 }]
//      gstin                        : stcd3;
//
//      @UI.lineItem                 : [{label: 'Material Code', position: 160 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Material Code', position: 160 }]
//      matnr                        : matnr;
//
//      @UI.lineItem                 : [{label: 'Material Description', position: 165 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Material Description', position: 165 }]
//      maktx                        : maktx;
//
//      @UI.lineItem                 : [{label: 'Material Grp', position: 167 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Material Grp', position: 167 }]
//      MATERIALGROUP                : abap.char(20);
//
////      @UI.lineItem                 : [{label: 'HSN Code', position: 170 ,importance: #HIGH }]
////      @UI.identification           : [{ label: 'HSN COde', position: 170 }]
////      STEUC                        : abap.char(20);
//
//      // @UI.hidden: true
//      @UI.lineItem                 : [{label: 'UoM', position: 180 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'UoM', position: 180 }]
//      uom                          : meins;
//
//      @UI.lineItem                 : [{label: 'Billing Qty', position: 190 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Billing Qty', position: 190 }]
//      @Semantics.quantity.unitOfMeasure : 'uom'
//      fkimg                        : menge_d;
//
//      @UI.lineItem                 : [{label: 'Currency', position: 200 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Currency', position: 200 }]
//      // @UI.hidden: true
//      currency                     : waers;
//
//      @UI.lineItem                 : [{label: 'Exchange Rate', position: 205 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Exchange rate', position: 205 }]
//      // @UI.hidden: true
//      //  @Semantics.amount.currencyCode : 'currency'
//      KURRF                        : abap.char(20);
//
//      @UI.lineItem                 : [{label: 'Rate', position: 210 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Rate', position: 210 }]
//      @Semantics.amount.currencyCode : 'currency'
//      rate                         : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'Net Value', position: 220 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Net Valye', position: 220 }]
//      @Semantics.amount.currencyCode : 'currency'
//      netvalue                     : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'Tax', position: 230 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Tax', position: 230 }]
//      @Semantics.amount.currencyCode : 'currency'
//      tax                          : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'Insurance', position: 240 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Insurance', position: 240 }]
//      @Semantics.amount.currencyCode : 'currency'
//      insurance                    : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'Freight', position: 250 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Freight', position: 250 }]
//      @Semantics.amount.currencyCode : 'currency'
//      freight                      : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'Total Value', position: 260 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Total Value', position: 260 }]
//      @Semantics.amount.currencyCode : 'currency'
//      totalvalue                   : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'CGST %', position: 270 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'CGST %', position: 270 }]
//      @Semantics.amount.currencyCode : 'currency'
//      cgstperc                     : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'CGST Value', position: 270 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'CGST Value', position: 270 }]
//      @Semantics.amount.currencyCode : 'currency'
//      cgstvalue                    : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'SGST %', position: 275 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'SGST %', position: 275 }]
//      @Semantics.amount.currencyCode : 'currency'
//      sgstperc                     : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'SGST Value', position: 280 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'SGST Value', position: 280 }]
//      @Semantics.amount.currencyCode : 'currency'
//      sgstvalue                    : abap.curr(10,2);
//
//
//      @UI.lineItem                 : [{label: 'UGST %', position: 285 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'UGST %', position: 285 }]
//      @Semantics.amount.currencyCode : 'currency'
//      ugstperc                     : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'UGST Value', position: 290 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'UGST Value', position: 290 }]
//      @Semantics.amount.currencyCode : 'currency'
//      ugstvalue                    : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'IGST %', position: 300 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'IGST %', position: 300 }]
//      @Semantics.amount.currencyCode : 'currency'
//      igstperc                     : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'IGST Value', position: 300 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'IGST Value', position: 300 }]
//      @Semantics.amount.currencyCode : 'currency'
//      igstvalue                    : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'TCS Value', position: 310 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'TCS Value', position: 310 }]
//      @Semantics.amount.currencyCode : 'currency'
//      tcsvalue                     : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'RoundOff', position: 320 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'RoundOff', position: 320 }]
//      @Semantics.amount.currencyCode : 'currency'
//      roundoff                     : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'Profit center', position: 330 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Profit center', position: 330 }]
//      PROFITCENTER                 : abap.char(20);
//
//      @UI.lineItem                 : [{label: 'Cocd Currency', position: 370 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Cocd Currency', position: 370 }]
//      @UI.hidden                   : true
//      companycodecurrency          : waers;
//
//      @UI.lineItem                 : [{label: 'Amount in INR', position: 340 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Amount in INR', position: 340 }]
//      @Semantics.amount.currencyCode : 'companycodecurrency'
//      amt_inr                      : abap.curr(10,2);
//
//      @UI.lineItem                 : [{label: 'G/L Account', position: 350 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'G/L Account', position: 350 }]
//      glacct                       : abap.char(20);
//
//      @UI.lineItem                 : [{label: 'G/L Account name', position: 360 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'G/L Account name', position: 360 }]
//      glacct_nm                    : abap.char(20);
//
//      @UI.lineItem                 : [{label: 'Sales organization', position: 380 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Sales org', position: 380 }]
//      salesorganization            : abap.char(4);
//
//      @UI.lineItem                 : [{label: 'Distribution channel', position: 390 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Distribution channel', position: 390 }]
//      DISTRIBUTIONCHANNEL          : abap.char(4);
//
//      @UI.lineItem                 : [{label: 'Division', position: 400 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Division', position: 400 }]
//      DIVISION                     : abap.char(3);
//
//      @UI.lineItem                 : [{label: 'Customer group', position: 410 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Customer group', position: 410 }]
//      customergroup                : abap.char(10);
//
//      @UI.lineItem                 : [{label: 'Destination country', position: 420 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Sales org', position: 420 }]
//      country                      : abap.char(4);
//
//      @UI.lineItem                 : [{label: 'Incoterms', position: 430 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Incoterms', position: 430 }]
//      incotermsclassification      : abap.char(4);
//
//      @UI.lineItem                 : [{label: 'Payment terms', position: 440 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Payment terms', position: 440 }]
//      customerpaymentterms         : abap.char(10);
//
//      @UI.lineItem                 : [{label: 'Region', position: 440 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Region', position: 440 }]
//      region                       : abap.char(20);
//
//      @UI.lineItem                 : [{ label: 'Advance License', position: 450, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Advance License', position: 450 }]
//      yy1_advancelicense_bdh       : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Bank Ref No', position: 460, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Bank Ref No', position: 460 }]
//      yy1_bankrefno_bdh            : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Bond or LUT', position: 470, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Bond or LUT', position: 470 }]
//      yy1_bondorlut_bdh            : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'BRC No', position: 480, importance: #HIGH }]
//      @UI.identification           : [{ label: 'BRC No', position: 480 }]
//      yy1_brcno_bdh                : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'DBK Scroll Date', position: 490, importance: #HIGH }]
//      @UI.identification           : [{ label: 'DBK Scroll Date', position: 490 }]
//      yy1_dbkscrolldate_bdh        : abap.dats;
//
//      @UI.lineItem                 : [{ label: 'DBK Scroll No', position: 500, importance: #HIGH }]
//      @UI.identification           : [{ label: 'DBK Scroll No', position: 500 }]
//      yy1_dbkscrollno_bdh          : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Duty Drawback', position: 510, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Duty Drawback', position: 510 }]
//      yy1_dutydrawback_bdh         : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'EPCG', position: 520, importance: #HIGH }]
//      @UI.identification           : [{ label: 'EPCG', position: 520 }]
//      yy1_epcg_bdh                 : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Lodge No', position: 530, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Lodge No', position: 530 }]
//      yy1_lodgeno_bdh              : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'LUT No 2', position: 540, importance: #HIGH }]
//      @UI.identification           : [{ label: 'LUT No 2', position: 540 }]
//      yy1_lutno2_bdh               : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'RBI Ref No', position: 550, importance: #HIGH }]
//      @UI.identification           : [{ label: 'RBI Ref No', position: 550 }]
//      yy1_rbirefno_bdh             : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'RODTEP', position: 560, importance: #HIGH }]
//      @UI.identification           : [{ label: 'RODTEP', position: 560 }]
//      yy1_rodtep_bdh               : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'RODTEP Scroll Date', position: 570, importance: #HIGH }]
//      @UI.identification           : [{ label: 'RODTEP Scroll Date', position: 570 }]
//      yy1_rodtepscrolldate_bdh     : abap.dats;
//
//      @UI.lineItem                 : [{ label: 'RODTEP Scroll No', position: 580, importance: #HIGH }]
//      @UI.identification           : [{ label: 'RODTEP Scroll No', position: 580 }]
//      yy1_rodtepscrollno_bdh       : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Shipper Seal No 1', position: 590, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Shipper Seal No 1', position: 590 }]
//      yy1_shippersealno1_bdh       : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Shipping Bill Date', position: 600, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Shipping Bill Date', position: 600 }]
//      yy1_shippingbilldate_bdh     : abap.dats;
//
//      @UI.lineItem                 : [{ label: 'Shipping Bill Exch. Rate', position: 610, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Shipping Bill Exch. Rate', position: 610 }]
//      @Semantics.amount.currencyCode : 'companycodecurrency'
//      yy1_shippingbillexchan_bdh   : abap.curr(10,2);
//
//      @UI.lineItem                 : [{ label: 'Shipping Bill No', position: 620, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Shipping Bill No', position: 620 }]
//      yy1_shippingbillno_bdh       : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'LR Date', position: 630, importance: #HIGH }]
//      @UI.identification           : [{ label: 'LR Date', position: 630 }]
//      yy1_lrdate_bdh               : abap.dats;
//
//      @UI.lineItem                 : [{ label: 'LR No', position: 640, importance: #HIGH }]
//      @UI.identification           : [{ label: 'LR No', position: 640 }]
//      yy1_lrno_bdh                 : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Seal No 1', position: 650, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Seal No 1', position: 650 }]
//      yy1_sealno1_bdh              : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Vessel No', position: 660, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Vessel No', position: 660 }]
//      yy1_vesselno_bdh             : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Customer search term', position: 670, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Customer search term', position: 670 }]
//      sortfield                    : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Actual freight', position: 680, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Actual freight', position: 680 }]
//      yy1_actualfreight_bdh        : abap.char(20);
//
//      @UI.lineItem                 : [{ label: 'Container no', position: 690, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Container no', position: 690 }]
//      yy1_containerno1_bdh         : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Container size', position: 700, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Container size', position: 700 }]
//      yy1_containersize_bdh        : abap.char(20);
//
//      @UI.lineItem                 : [{ label: 'Let Export date', position: 710, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Let Export date', position: 710 }]
//      yy1_letexportdate_bdh        : abap.dats;
//
//      @UI.lineItem                 : [{ label: 'Leo date', position: 680, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Leo date', position: 680 }]
//      yy1_leodate_bdh              : abap.dats;
//
//      @UI.lineItem                 : [{ label: 'Vehicle no', position: 690, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Vehicle no', position: 690 }]
//      YY1_VehicleNo2_BDH           : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'Vehicle type', position: 700, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Vehicle type', position: 700 }]
//      YY1_VehicleType_BDH          : abap.char(20);
//
//      @UI.lineItem                 : [{label: 'Credit amount', position: 710 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Credit amount', position: 710 }]
//      @Semantics.amount.currencyCode : 'companycodecurrency'
//      creditamt                    : abap.curr(10,2);
//
//      @UI.lineItem                 : [{ label: 'Journal entry no', position: 720, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Journal entry no', position: 720 }]
//      journalentry_no              : abap.char(20);
//
//      @UI.lineItem                 : [{ label: 'Jounral entry date', position: 730, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Jounral entry date', position: 730 }]
//      postingdate                  : abap.dats;
//
//      @UI.lineItem                 : [{ label: 'Material by Customer', position: 740, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Material by Customer', position: 740 }]
//      materialbycustomer           : abap.char(35);
//
//      @UI.lineItem                 : [{ label: 'Customer PO Supplement', position: 750, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Customer PO Supplement', position: 750 }]
//      CustomerPurchaseOrderSuplmnt : abap.char(35);
//
//      @UI.lineItem                 : [{ label: 'Customer PO Date', position: 760, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Customer PO Date', position: 760 }]
//      CustomerPurchaseOrderDate    : abap.dats;
//
//      @UI.lineItem                 : [{ label: 'Group BP Name 1', position: 770, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Group BP Name 1', position: 770 }]
//      groupbusinesspartnername1    : abap.char(40);
//
//      @UI.lineItem                 : [{ label: 'Group BP Name 2', position: 780, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Group BP Name 2', position: 780 }]
//      groupbusinesspartnername2    : abap.char(40);
//
//      @UI.lineItem                 : [{ label: 'Discount Amount', position: 790, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Discount Amount', position: 790 }]
//      @Semantics.amount.currencyCode : 'currency'
//      discount                     : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Discount Percentage', position: 800, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Discount Percentage', position: 800 }]
//      @Semantics.amount.currencyCode : 'currency'
//      discount_per                 : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Free of Charge Amount', position: 810, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Free of Charge Amount', position: 810 }]
//      @Semantics.amount.currencyCode : 'currency'
//      freeofcharge                 : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Free of Charge Percentage', position: 820, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Free of Charge Percentage', position: 820 }]
//      @Semantics.amount.currencyCode : 'currency'
//      freeofcharge_per             : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Freight Discount Amount', position: 830, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Freight Discount Amount', position: 830 }]
//      @Semantics.amount.currencyCode : 'currency'
//      freightdiscount              : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Freight Discount Percentage', position: 840, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Freight Discount Percentage', position: 840 }]
//      @Semantics.amount.currencyCode : 'currency'
//      freightdiscount_per          : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Price Adjustment Amount', position: 850, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Price Adjustment Amount', position: 850 }]
//      @Semantics.amount.currencyCode : 'currency'
//      priceadjustment              : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Price Adjustment Percentage', position: 860, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Price Adjustment Percentage', position: 860 }]
//      @Semantics.amount.currencyCode : 'currency'
//      priceadjustment_per          : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Value Adjustment Amount', position: 870, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Value Adjustment Amount', position: 870 }]
//      @Semantics.amount.currencyCode : 'currency'
//      valueadjustment              : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Value Adjustment Percentage', position: 880, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Value Adjustment Percentage', position: 880 }]
//      @Semantics.amount.currencyCode : 'currency'
//      valueadjustment_per          : abap.curr(16,2);
//
//      @UI.lineItem                 : [{ label: 'Old product id', position: 890, importance: #HIGH }]
//      @UI.identification           : [{ label: 'Old product id', position: 890 }]
//      productoldid                 : abap.char(20);
//
//      @UI.lineItem                 : [{label: 'cgst Stat', position: 900 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'cgst Stat', position: 900 }]
//      cgst_stat                    : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'sgst Stat', position: 905 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'sgst Stat', position: 905 }]
//      sgst_stat                    : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'ugst Stat', position: 905 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'ugst Stat', position: 905 }]
//      ugst_stat                    : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'igst Stat', position: 910 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'igst Stat', position: 910 }]
//      igst_stat                    : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'JTC Stat', position: 915 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'JTC Stat', position: 915 }]
//      jtc_stat                     : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'Roundoff Stat', position: 920 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Roundoff Stat', position: 920 }]
//      roundoff_stat                : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'Insurance Stat', position: 925 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'igst Stat', position: 925 }]
//      zins_stat                    : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'Freight Stat', position: 930 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Freight Stat', position: 930 }]
//      freight_stat                 : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'Discount Stat', position: 935 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Discount Stat', position: 935 }]
//      discount_stat                : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'Freeofcharge Stat', position: 940 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Freeofcharge Stat', position: 940 }]
//      foc_stat                     : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'Frt discount Stat', position: 945 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Frt discount Stat', position: 945 }]
//      frt_discount_stat            : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'Price adjust Stat', position: 950 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Price adjust Stat', position: 950 }]
//      prc_adjust_stat              : abap.char(1);
//
//      @UI.lineItem                 : [{label: 'Val adjust Stat', position: 955 ,importance: #HIGH }]
//      @UI.identification           : [{ label: 'Val adjust Stat', position: 955 }]
//      val_adjust_stat              : abap.char(1);
//
//      @UI.lineItem                 : [{ label: 'hsncode', position: 960, importance: #HIGH }]
//      @UI.identification           : [{ label: 'hsncode', position: 960 }]
////      HSNCODE                      : abap.char(50);
//      consumptiontaxctrlcode       : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'custom_hsn', position: 1010, importance: #HIGH }]
//      @UI.identification           : [{ label: 'custom_hsn', position: 1010 }]
//      custom_hsn                   : abap.char(50);
//
//      @UI.lineItem                 : [{ label: 'CI hsn', position: 1010, importance: #HIGH }]
//      @UI.identification           : [{ label: 'CI hsn', position: 1010 }]
//      ci_hsn                       : abap.char(50);
//

}
