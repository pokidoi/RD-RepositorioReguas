SELECT
    x.id_cliente,
    x.cd_produto,
    to_char(x.dt_emissao, 'DD/MM/YYYY') dt_emissao,
    to_char(x.data_onboard, 'DD/MM/YYYY') data_onboard,
    to_char((x.data_base - 5) - decode(to_char(x.data_base - 5, 'd'), 7, 1, 1, 2,
                                       0), 'DD/MM/YYYY') dt_primeiro_lembrete,
    to_char((x.data_base + 7) - decode(to_char(x.data_base + 7, 'd'), 7, 1, 1, 2,
                                       0), 'DD/MM/YYYY') dt_segundo_lembrete,
    to_char(decode(to_char(x.data_base_resgate, 'D'), 1, x.data_base_resgate + 1, 2, x.data_base_resgate + 7,
                   3, x.data_base_resgate + 6, 4, x.data_base_resgate + 5, 5,
                   x.data_base_resgate + 4, 6, x.data_base_resgate + 3, 7, x.data_base_resgate + 2), 'DD/MM/YYYY') data_resgate,
    to_char(x.data_base, 'DD/MM/YYYY') data_base,
    x.qt_item,
    x.nr_duracao_caixa,
    x.qt_dose_diaria,
    x.cd_filial,
    x.cd_logomarca,
    x.ds_logomarca,
    x.cd_classeterap
FROM
    (
        SELECT DISTINCT
            c.id_cliente,
            a.cd_produto,
            b.dt_emissao,
            b.qt_item,
            a.nr_duracao_caixa,
            a.qt_dose_diaria,
            ( b.dt_emissao + ( ( b.qt_item * a.nr_duracao_caixa ) / a.qt_dose_diaria ) ) data_base,
            ( b.dt_emissao + ( ( b.qt_item * a.nr_duracao_caixa ) / a.qt_dose_diaria ) ) + 14 data_base_resgate,
            decode(to_char(b.dt_emissao, 'D'), 1, b.dt_emissao + 8, 2, b.dt_emissao + 14,
                   3, b.dt_emissao + 13, 4, b.dt_emissao + 12, 5,
                   b.dt_emissao + 11, 6, b.dt_emissao + 10, 7, b.dt_emissao + 9) data_onboard,
            d.cd_filial,
            e.cd_logomarca,
            e.ds_logomarca,
            f.cd_classeterap
        FROM
            tb_produto_tratamento   a,
            tb_nf_item              b,
            tb_nf                   c,
            tb_filial               d,
            tb_logomarca            e,
            tb_produto              f
        WHERE
            a.nr_duracao_caixa > 9
            AND b.cd_produto = a.cd_produto
            AND c.id_nf = b.id_nf
            AND c.dt_emissao >= trunc(sysdate - 1)
            AND c.dt_emissao < trunc(sysdate)
            AND c.cd_operacao_fiscal = 1
            AND d.cd_filial = c.cd_filial
            AND e.cd_logomarca = d.cd_logomarca
            AND f.cd_produto = a.cd_produto
            AND NOT EXISTS (
                SELECT
                    1
                FROM
                    tb_aderencia_tratamento_client x
                WHERE
                    x.id_cliente = c.id_cliente
                    AND x.cd_aderencia_tratamento <> 9990
            )
    ) x
