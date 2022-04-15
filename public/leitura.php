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
		
        $livro = 'livro_id';
        $leitor = 'leitor_id';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'SELECT ' . $livro . ',' . $leitor . ' FROM livro_leitor';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . $livro . '</th>' .
            '        <th>' . $leitor . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$livro] . '</td>' .
					 '<td>' . $registro[$leitor] . '</td>' ;
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