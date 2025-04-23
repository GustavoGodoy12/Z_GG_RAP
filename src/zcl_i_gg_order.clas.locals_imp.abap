CLASS lhc_ZI_gg_ORDER DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_gg_ORDER RESULT result.

    METHODS earlynumbering_cba_Itens FOR NUMBERING
      IMPORTING entities FOR CREATE ZI_gg_ORDER\_Itens.

    METHODS SendOrder FOR MODIFY
      IMPORTING keys FOR ACTION ZI_gg_ORDER~SendOrder.

    METHODS updateFields FOR DETERMINE ON SAVE
      IMPORTING keys FOR ZI_gg_ORDER~updateFields.

ENDCLASS.

CLASS lhc_ZI_gg_ORDER IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_cba_Itens.

    LOOP AT ENTITIES INTO data(entity).

        LOOP AT entity-%target ASSIGNING FIELD-SYMBOL(<lf_target>).

            SELECT MAX( item )
            FROM ZTGG_ORDER_IT
            WHERE order_id = @entity-Orderid
            INTO @data(lv_last_item).

            data(lv_next_item) = lv_last_item + 1.

            INSERT VALUE #(
                %cid = <lf_target>-%cid
                OrderId = <lf_target>-OrderId
                item = lv_next_item
            ) INTO TABLE mapped-item .

        ENDLOOP.

    ENDLOOP.

  ENDMETHOD.

  METHOD SendOrder.

    READ ENTITIES OF zi_gg_order IN LOCAL MODE
    ENTITY Order
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

    LOOP AT lt_data INTO DATA(ls_data).

      APPEND INITIAL LINE TO reported-Order ASSIGNING FIELD-SYMBOL(<lf_rep>).
      <lf_rep>-%key-Orderid = ls_data-Orderid.
      <lf_rep>-%msg = new_message(
                        id       = '00'
                        number   = '001'
                        severity = if_abap_behv_message=>severity-success
                        v1       = 'Ordem enviada com sucesso'
                      ).

    ENDLOOP.

  ENDMETHOD.


  METHOD updateFields.

    READ ENTITIES OF zi_gg_order IN LOCAL MODE
    ENTITY Order
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lf_data>).

        MODIFY ENTITIES OF zi_gg_order IN LOCAL MODE
        ENTITY Order
        UPDATE FIELDS ( usnam ) WITH value #( ( %tky-OrderId = <lf_data>-%tky-OrderId usnam = sy-uname ) ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS validateQuantity FOR VALIDATE ON SAVE
      IMPORTING keys FOR Item~validateQuantity.

ENDCLASS.

CLASS lhc_Item IMPLEMENTATION.

  METHOD validateQuantity.

    READ ENTITIES OF zi_gg_order IN LOCAL MODE
    ENTITY Item
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lf_item>).
        IF <lf_item>-Quantity < 2.

            APPEND INITIAL LINE TO failed-item ASSIGNING FIELD-SYMBOL(<lf_fail>).
            <lf_fail>-%key-OrderId = <lf_item>-OrderId.
            <lf_fail>-%key-Item = <lf_item>-Item.

            APPEND INITIAL LINE TO reported-item ASSIGNING FIELD-SYMBOL(<lf_rep>).
            <lf_rep>-%key-OrderId = <lf_item>-OrderId.
            <lf_rep>-%key-Item = <lf_item>-Item.
            <lf_rep>-%msg = new_message(
                                     id = '00'
                                     number = '001'
                                     severity = if_abap_behv_message=>severity-error
                                     v1 = 'Quantidade miníma é 2'
                                        ).

        ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
