SELECT 
    x.cd_produto, 
    x.qt_item, 
    TO_CHAR(x.dt_emissao,'DD/MM/YYYY') dt_emissao, 
    x.data_base, 
    (x.data_base - 5) as dt_primeiro_lembrete, 
    (x.data_base + 7) as dt_segundo_lembrete, 
    X.data_base_resgate, 
    x.nr_duracao_caixa, 
    x.qt_dose_diaria, 
    x.cd_filial, 
    x.cd_logomarca, 
    x.ds_logomarca, 
    x.cd_classeterap 
FROM 
    ( 
        SELECT 
            compras.cd_produto, 
            compras.qt_item, 
            compras.dt_emissao, 
            ( compras.dt_emissao + ( ( compras.qt_item * compras.nr_duracao_caixa ) / compras.qt_dose_diaria ) ) data_base, 
            ( compras.dt_emissao + ( ( compras.qt_item * compras.nr_duracao_caixa ) / compras.qt_dose_diaria ) ) + 14 data_base_resgate, 
            compras.nr_duracao_caixa, 
            compras.qt_dose_diaria, 
            compras.cd_filial, 
            compras.cd_logomarca, 
            compras.ds_logomarca, 
            compras.cd_classeterap 
        FROM 
            ( 
                SELECT 
                    a.id_cliente, 
                    b.cd_produto, 
                    b.dt_emissao, 
                    SUM(b.qt_item) qt_item, 
                    c.nr_duracao_caixa, 
                    c.qt_dose_diaria, 
                    d.cd_filial, 
                    e.cd_logomarca, 
                    e.ds_logomarca, 
                    f.cd_classeterap 
                FROM 
                    tb_nf a, 
                    tb_nf_item b, 
                    tb_produto_tratamento c, 
                    tb_filial d, 
                    tb_logomarca e, 
                    tb_produto f 
                WHERE 
                    a.cd_operacao_fiscal = 1 
                    AND   a.id_cliente = ? 
                    AND   a.dt_emissao >= trunc(SYSDATE - 365) 
                    AND   a.dt_emissao < trunc(SYSDATE - 1) 
                    AND   b.id_nf = a.id_nf 
                    AND   c.nr_duracao_caixa > 9 
                    AND   c.cd_produto = b.cd_produto 
                    AND   d.cd_filial = a.cd_filial 
                    AND   e.cd_logomarca = d.cd_logomarca 
                    AND   f.cd_produto = c.cd_produto 
                GROUP BY 
                    a.id_cliente, 
                    b.cd_produto, 
                    b.dt_emissao, 
                    c.nr_duracao_caixa, 
                    c.qt_dose_diaria, 
                    d.cd_filial, 
                    e.cd_logomarca, 
                    e.ds_logomarca, 
                    f.cd_classeterap 
                ORDER BY 
                    2, 
                    3 
            ) compras 
    ) x 
