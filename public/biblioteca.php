<!DOCTYPE html>

<head>
    <style>
        .content {
            max-width: 500px;
            margin: auto;
        }
    </style>
</head>

<html>

<body>
    <div class="content">
        <h1>Biblioteca</h1>

        <h2>Biblioteca dos Leitores</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();
        
        $leitor = 'leitor_nome';
        $categoria = 'categoria';
        $comentario = 'comentario';
        $livro = 'titulo_livro';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'SELECT ' . $leitor . ',' . $categoria . ',' . $comentario . ',' . $livro .
            ' FROM db_app_db2.leitor' .
            ' JOIN db_app_db2.biblioteca' . 
            ' JOIN db_app_db2.livro' . 
                ' ON livro.livro_id = biblioteca.livro_id AND biblioteca.leitor_id = leitor.leitor_id';

        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . $leitor . '</th>' .
            '        <th>' . $categoria . '</th>' .
            '        <th>' . $comentario . '</th>' .
            '        <th>' . $livro . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$leitor] . '</td>' .
                     '<td>' . $registro[$categoria] . '</td>' .
                     '<td>' . $registro[$comentario] . '</td>' .
					 '<td>' . $registro[$livro] . '</td>' ;
                     
                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo '';
        }
        FecharConexao($conexao);
        ?>
    </div>
</body>

</html>