CLASS zcl_sales_register DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SALES_REGISTER IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA : lv_refdoc TYPE i_accountingdocumentjournal-referencedocument .
*   IF io_request->is_data_requested( ).
    DATA: lt_response TYPE TABLE OF zce_sales_register,
          ls_response TYPE zce_sales_register.
    DATA(lv_top)           = io_request->get_paging( )->get_page_size( ).
    DATA(lv_skip)          = io_request->get_paging( )->get_offset( ).
    DATA(lt_clause)        = io_request->get_filter( )->get_as_sql_string( ).
    DATA(lt_fields)        = io_request->get_requested_elements( ).
    DATA(lt_sort)          = io_request->get_sort_elements( ).

    IF lv_top < 0.
      lv_top = 1.
    ENDIF.

    TRY.
        DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).
      CATCH cx_rap_query_filter_no_range INTO DATA(lx_no_sel_option).
    ENDTRY.

    DATA(lr_fkdat)   =  VALUE #( lt_filter_cond[ name   = 'FKDAT' ]-range OPTIONAL ).
    DATA(lr_bukrs)   =  VALUE #( lt_filter_cond[ name   = 'BUKRS' ]-range OPTIONAL ).
    DATA(lr_werks)   =  VALUE #( lt_filter_cond[ name   = 'WERKS' ]-range OPTIONAL ).
    DATA(lr_fkart)   =  VALUE #( lt_filter_cond[ name   = 'FKART' ]-range OPTIONAL ).
    DATA(lr_kunnr)   =  VALUE #( lt_filter_cond[ name   = 'SOLD_TO' ]-range OPTIONAL ).
    DATA(lr_vbeln)   =  VALUE #( lt_filter_cond[ name   = 'VBELN' ]-range OPTIONAL ).

    SELECT FROM i_billingdocument AS a
           JOIN i_billingdocumentitem AS b
           ON ( a~billingdocument = b~billingdocument )

    FIELDS a~billingdocument,
           b~billingdocumentitem
     WHERE a~billingdocumentdate IN @lr_fkdat
     AND   a~companycode IN @lr_bukrs
     AND   a~billingdocumenttype IN @lr_fkart
     AND   a~soldtoparty IN @lr_kunnr
     AND   a~billingdocument IN @lr_vbeln
     AND   b~plant IN @lr_werks
     INTO TABLE @DATA(lt_data).

    SELECT FROM i_billingdocument AS a
           JOIN i_billingdocumentitembasic AS b
           ON ( a~billingdocument = b~billingdocument )
     JOIN  i_billingdocumentbasic AS f
          ON ( a~billingdocument = f~billingdocument )
     LEFT OUTER JOIN i_customer AS a1
           ON ( a~soldtoparty = a1~customer )
     LEFT OUTER JOIN i_customer AS a11
           ON ( a~payerparty = a11~customer )
     LEFT OUTER JOIN i_salesdocumentpartner AS c
           ON ( b~salesdocument = c~salesdocument
           AND  c~partnerfunction = 'WE' )
     LEFT OUTER JOIN i_customer AS c1
           ON ( c~customer = c1~customer )
     LEFT OUTER JOIN i_billingdocumentpartner AS d
           ON ( a~billingdocument = d~billingdocument
           AND  d~partnerfunction = 'RE' )
     LEFT OUTER JOIN i_customer AS d1
           ON ( d~customer = d1~customer )
     LEFT OUTER JOIN i_productplantbasic AS e
           ON ( b~product = e~product
           AND  b~plant   = e~plant )
     LEFT OUTER JOIN i_salesorderitem AS g
           ON b~salesdocument EQ g~salesorder
           AND b~salesdocumentitem EQ g~salesorderitem
     LEFT OUTER JOIN i_salesorder AS i
           ON b~salesdocument EQ i~salesorder
     LEFT OUTER JOIN i_businesspartner AS h
           ON d~customer EQ h~businesspartner
     LEFT OUTER JOIN i_product AS j
          ON b~product EQ j~product
     LEFT OUTER JOIN i_productplantbasic AS k
          ON b~product EQ k~product
          and k~consumptiontaxctrlcode ne ''
**          AND b~plant  EQ k~plant
*     LEFT OUTER JOIN zsd_hsncode AS k
*          ON b~product EQ k~product
*          and k~consumptiontaxctrlcode ne ''
    FIELDS a~billingdocument,
           b~billingdocumentitem,
           a~billingdocumentdate,
           a~companycode,
           a~transactioncurrency,
           a~accountingexchangerate,
           a~soldtoparty,
           a1~customername AS sold_to_nm,
           a~billingdocumenttype,
           a~payerparty,
           a~salesorganization,
           a~distributionchannel,
           a~division,
           a~customergroup,
           a~country,
           a~incotermsclassification,
           a~customerpaymentterms,
           a~region,
           a~yy1_advancelicense_bdh ,
           a~yy1_bankrefno_bdh,
           a~yy1_bondorlut_bdh,
           a~yy1_brcno_bdh,
           a~yy1_dbkscrolldate_bdh,
           a~yy1_dbkscrollno_bdh ,
           a~yy1_dutydrawback_bdh ,
           a~yy1_epcg_bdh    ,
           a~yy1_lodgeno_bdh ,
           a~yy1_lutno2_bdh  ,
           a~yy1_rbirefno_bdh ,
           a~yy1_rodtep_bdh  ,
           a~yy1_rodtepscrolldate_bdh ,
           a~yy1_rodtepscrollno_bdh  ,
           a~yy1_shippersealno1_bdh  ,
           a~yy1_shippingbilldate_bdh ,
           a~yy1_shippingbillexchan_bdh,
           a~yy1_shippingbillno_bdh,
           f~yy1_lrdate_bdh,
           f~yy1_lrno_bdh,
           f~yy1_sealno1_bdh,
           f~yy1_vesselno_bdh,
           f~yy1_actualfreight_bdh,
           f~yy1_containerno1_bdh,
           f~yy1_containersize_bdh,
           f~yy1_letexportdate_bdh,
           f~yy1_leodate_bdh,
           f~yy1_vehicleno2_bdh,
           f~yy1_vehicletype_bdh,
           a11~customername AS payernm,
           c~customer AS shipto,
           c1~customername AS shiptonm,
           d~customer AS billto,
           d1~customername AS billtonm,
           d1~taxnumber3 AS gstin,
           d1~sortfield,
           b~referencesddocument,
           b~referencesddocumentitem,
           b~salesdocument,
           b~salesdocumentitem,
           b~plant,
           b~product,
           b~materialgroup,
           b~billingdocumentitemtext,
           b~billingquantity,
           b~billingquantityunit,
           b~netamount,
           b~taxamount,
           b~profitcenter,
           b~yy1_customhsn_bdi,
           b~yy1_comercialhsn_bdi,
           b~pricedetnexchangerate,
**           e~consumptiontaxctrlcode,
           g~materialbycustomer,
**           i~customerpurchaseordersuplmnt,
**           i~customerpurchaseorderdate,
**           h~groupbusinesspartnername1,
**           h~groupbusinesspartnername2,
           j~productoldid,
           k~consumptiontaxctrlcode,
           k~consumptiontaxctrlcode AS hsncode9
     WHERE a~billingdocumentdate IN @lr_fkdat
     AND   a~companycode IN @lr_bukrs
     AND   a~billingdocumenttype IN @lr_fkart
     AND   a~soldtoparty IN @lr_kunnr
     AND   a~billingdocument IN @lr_vbeln
     AND   b~plant IN @lr_werks
     AND   b~billingquantity GT 0
     ORDER BY a~billingdocument, b~billingdocumentitem
     INTO TABLE @DATA(lt_inv)
     UP TO @lv_top ROWS OFFSET @lv_skip.

    IF lt_inv[] IS NOT INITIAL.
      DELETE ADJACENT DUPLICATES FROM lt_inv COMPARING billingdocument billingdocumentitem .
      SELECT FROM i_billingdocumentitemprcgelmnt
       FIELDS billingdocument, billingdocumentitem, conditiontype,
              conditionratevalue, conditioncurrency, conditionamount, conditionisforstatistics
          FOR ALL ENTRIES IN @lt_inv
          WHERE billingdocument = @lt_inv-billingdocument
          AND   billingdocumentitem = @lt_inv-billingdocumentitem
          INTO TABLE @DATA(lt_prcd).
      SORT lt_prcd BY billingdocument billingdocumentitem conditiontype.

**      SELECT accountingdocument,
**          ledger,
**         ledgergllineitem,
**         accountingdocumentitem,
**         glaccount,
**         glaccountname,
**         referencedocument,
**         companycodecurrency,
**         postingdate,
**         creditamountincocodecrcy
**    FROM i_accountingdocumentjournal( p_language = 'E' )
**    FOR ALL ENTRIES IN @lt_inv
**    WHERE referencedocument = @lt_inv-billingdocument
**    AND   accountingdocumentitem = '002'
**     INTO TABLE @DATA(it_glacct).

    ENDIF.


    LOOP AT lt_inv INTO DATA(ls_inv).

      ls_response-fkdat = ls_inv-billingdocumentdate.
      ls_response-bukrs = ls_inv-companycode.
      ls_response-sold_to = ls_inv-soldtoparty.
      ls_response-sold_to_nm = ls_inv-sold_to_nm.
      ls_response-werks = ls_inv-plant.
      ls_response-vbeln = ls_inv-billingdocument.
      ls_response-fkart = ls_inv-billingdocumenttype.
      ls_response-posnr = ls_inv-billingdocumentitem.
      ls_response-vbeln_d  = ls_inv-referencesddocument.
      ls_response-posnr_d  = ls_inv-referencesddocumentitem.
      ls_response-vbeln_s  = ls_inv-salesdocument.
      ls_response-posnr_s  = ls_inv-salesdocumentitem.
      ls_response-shipto   = ls_inv-shipto.
      ls_response-shiptonm = ls_inv-shiptonm.
      ls_response-billto   = ls_inv-billto.
      ls_response-billtonm = ls_inv-billtonm.
      ls_response-payer    = ls_inv-payerparty.
      ls_response-payernm  = ls_inv-payernm.
      ls_response-gstin    = ls_inv-gstin.
      ls_response-matnr    = ls_inv-product.
      ls_response-maktx    = ls_inv-billingdocumentitemtext.
*      ls_response-steuc    = ls_inv-consumptiontaxctrlcode.
      ls_response-uom      = ls_inv-billingquantityunit.
      ls_response-fkimg    = ls_inv-billingquantity.
      ls_response-currency = ls_inv-transactioncurrency.
      ls_response-kurrf    = ls_inv-accountingexchangerate.
      ls_response-netvalue = ls_inv-netamount.
      ls_response-tax      = ls_inv-taxamount.
      ls_response-totalvalue = ls_inv-netamount + ls_inv-taxamount.
      ls_response-profitcenter = ls_inv-profitcenter .
      ls_response-salesorganization = ls_inv-salesorganization .
      ls_response-distributionchannel = ls_inv-distributionchannel .
      ls_response-division = ls_inv-division .
      ls_response-customergroup = ls_inv-customergroup.
      ls_response-country = ls_inv-country .
      ls_response-incotermsclassification = ls_inv-incotermsclassification.
      ls_response-customerpaymentterms = ls_inv-customerpaymentterms .
      ls_response-region = ls_inv-region .
      ls_response-yy1_advancelicense_bdh = ls_inv-yy1_advancelicense_bdh.
      ls_response-yy1_bankrefno_bdh = ls_inv-yy1_bankrefno_bdh.
      ls_response-yy1_bondorlut_bdh = ls_inv-yy1_bondorlut_bdh.
      ls_response-yy1_brcno_bdh = ls_inv-yy1_brcno_bdh.
      ls_response-yy1_dbkscrolldate_bdh = ls_inv-yy1_dbkscrolldate_bdh.
      ls_response-yy1_dbkscrollno_bdh = ls_inv-yy1_dbkscrollno_bdh.
      ls_response-yy1_dutydrawback_bdh = ls_inv-yy1_dutydrawback_bdh.
      ls_response-yy1_epcg_bdh = ls_inv-yy1_epcg_bdh.
      ls_response-yy1_lodgeno_bdh = ls_inv-yy1_lodgeno_bdh.
      ls_response-yy1_lutno2_bdh = ls_inv-yy1_lutno2_bdh.
      ls_response-yy1_rbirefno_bdh = ls_inv-yy1_rbirefno_bdh.
      ls_response-yy1_rodtep_bdh = ls_inv-yy1_rodtep_bdh.
      ls_response-yy1_rodtepscrolldate_bdh = ls_inv-yy1_rodtepscrolldate_bdh.
      ls_response-yy1_rodtepscrollno_bdh = ls_inv-yy1_rodtepscrollno_bdh.
      ls_response-yy1_shippersealno1_bdh = ls_inv-yy1_shippersealno1_bdh.
      ls_response-yy1_shippingbilldate_bdh = ls_inv-yy1_shippingbilldate_bdh.
      ls_response-yy1_shippingbillexchan_bdh = ls_inv-yy1_shippingbillexchan_bdh.
      ls_response-yy1_shippingbillno_bdh = ls_inv-yy1_shippingbillno_bdh.
      ls_response-yy1_lrdate_bdh = ls_inv-yy1_lrdate_bdh.
      ls_response-yy1_lrno_bdh = ls_inv-yy1_lrno_bdh.
      ls_response-yy1_sealno1_bdh = ls_inv-yy1_sealno1_bdh.
      ls_response-yy1_vesselno_bdh = ls_inv-yy1_vesselno_bdh.
      ls_response-sortfield = ls_inv-sortfield .
      ls_response-yy1_actualfreight_bdh = ls_inv-yy1_actualfreight_bdh.
      ls_response-yy1_containerno1_bdh = ls_inv-yy1_containerno1_bdh.
      ls_response-yy1_containersize_bdh = ls_inv-yy1_containersize_bdh.
      ls_response-yy1_letexportdate_bdh = ls_inv-yy1_letexportdate_bdh.
      ls_response-yy1_leodate_bdh       = ls_inv-yy1_leodate_bdh.
      ls_response-yy1_vehicleno2_bdh    = ls_inv-yy1_vehicleno2_bdh.
      ls_response-yy1_vehicletype_bdh   = ls_inv-yy1_vehicletype_bdh.
      ls_response-materialgroup         = ls_inv-materialgroup.
      ls_response-materialbycustomer    = ls_inv-materialbycustomer.
      ls_response-custom_hsn            = ls_inv-yy1_customhsn_bdi.
*      ls_response-hsncode            = ls_inv-consumptiontaxctrlcode.
      ls_response-consumptiontaxctrlcode = ls_inv-hsncode9.
      ls_response-custom_hsn            = ls_inv-YY1_CustomHSN_BDI.
      ls_response-productoldid          = ls_inv-productoldid.


      LOOP AT lt_prcd INTO DATA(ls_prcd)
        WHERE billingdocument = ls_inv-billingdocument
        AND   billingdocumentitem = ls_inv-billingdocumentitem.

        CASE ls_prcd-conditiontype.
*          WHEN 'PR00'.
          WHEN 'ZPR0'.
            ls_response-rate = ls_prcd-conditionratevalue.
          WHEN 'JOCG'.
            ls_response-cgstvalue = ls_prcd-conditionamount.
            ls_response-cgstperc  = ls_prcd-conditionratevalue.
            ls_response-cgst_stat = ls_prcd-conditionisforstatistics.
          WHEN 'JOSG'.
            ls_response-sgstvalue = ls_prcd-conditionamount.
            ls_response-sgstperc  = ls_prcd-conditionratevalue.
            ls_response-sgst_stat = ls_prcd-conditionisforstatistics.
          WHEN 'JOUG'.
            ls_response-ugstvalue = ls_prcd-conditionamount.
            ls_response-ugstperc = ls_prcd-conditionratevalue.
            ls_response-ugst_stat = ls_prcd-conditionisforstatistics.
          WHEN 'JOIG'.
            ls_response-igstvalue = ls_prcd-conditionamount.
            ls_response-igstperc = ls_prcd-conditionratevalue.
            ls_response-igst_stat = ls_prcd-conditionisforstatistics.
          WHEN 'JTC1' OR 'JTC2'.
            ls_response-tcsvalue = ls_prcd-conditionamount.
            ls_response-jtc_stat = ls_prcd-conditionisforstatistics.
          WHEN 'DIFF'.
            ls_response-roundoff = ls_prcd-conditionamount.
            ls_response-roundoff_stat = ls_prcd-conditionisforstatistics.
          WHEN 'ZINS'.
            ls_response-insurance = ls_prcd-conditionamount.
            ls_response-zins_stat = ls_prcd-conditionisforstatistics.
          WHEN 'ZFR1'.
            ls_response-freight = ls_prcd-conditionamount.
            ls_response-freight_stat = ls_prcd-conditionisforstatistics.
          WHEN 'ZDIS'.
            ls_response-discount = ls_prcd-conditionamount.
            ls_response-discount_per = ls_prcd-conditionratevalue.
            ls_response-discount_stat = ls_prcd-conditionisforstatistics.
          WHEN 'ZFOC'.
            ls_response-freeofcharge = ls_prcd-conditionamount.
            ls_response-freeofcharge_per = ls_prcd-conditionratevalue.
            ls_response-foc_stat = ls_prcd-conditionisforstatistics.
          WHEN 'ZFRD'.
            ls_response-freightdiscount = ls_prcd-conditionamount.
            ls_response-freightdiscount_per = ls_prcd-conditionratevalue.
            ls_response-frt_discount_stat = ls_prcd-conditionisforstatistics.
          WHEN 'ZPRD'.
            ls_response-priceadjustment = ls_prcd-conditionamount.
            ls_response-priceadjustment_per = ls_prcd-conditionratevalue.
            ls_response-prc_adjust_stat = ls_prcd-conditionisforstatistics.
          WHEN 'ZVLD'.
            ls_response-valueadjustment = ls_prcd-conditionamount.
            ls_response-valueadjustment_per = ls_prcd-conditionratevalue.
            ls_response-val_adjust_stat = ls_prcd-conditionisforstatistics.
        ENDCASE.

      ENDLOOP.

      APPEND ls_response TO lt_response.
      CLEAR : ls_response,  lv_refdoc . "wa_glcct.

    ENDLOOP.

    io_response->set_total_number_of_records( lines( lt_data ) ).
    io_response->set_data( lt_response ).

* ENDIF.

  ENDMETHOD.
ENDCLASS.
