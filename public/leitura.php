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

        <h2>Leitura</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();
        
        $leitor = 'leitor_nome';
        $livro = 'titulo_livro';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'SELECT ' . $leitor . ',' . $livro . ' FROM db_app_db2.leitura AS ll' .
            ' JOIN db_app_db2.leitor AS le' . 
            ' JOIN db_app_db2.livro AS li' . 
            ' ON ll.leitor_id = le.leitor_id AND ll.livro_id = li.livro_id';

        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . $leitor . '</th>' .
            '        <th>' . $livro . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$leitor] . '</td>' .
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