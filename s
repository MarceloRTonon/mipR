[1mdiff --git a/Topicos Suplementares/Git/intro_git.Rmd b/Topicos Suplementares/Git/intro_git.Rmd[m
[1mindex 8d40101..c6b93f5 100644[m
[1m--- a/Topicos Suplementares/Git/intro_git.Rmd[m	
[1m+++ b/Topicos Suplementares/Git/intro_git.Rmd[m	
[36m@@ -280,8 +280,88 @@[m [mb <- 2 + a[m
 b-2[m
 ```[m
 [m
[31m-Agora, com a mudança sendo percebida pelo Git vamos fazer:[m
[32m+[m[32mAgora, com a mudança sendo percebida pelo Git vá na aba Git, clique em commit e veja como as mudanças são rastreadas pelo Git. Você pode fazer o commit por nessa janela mesmo, ou pode fazer pelo Terminal da seguinte forma:[m
 [m
[32m+[m[32m```{bash}[m
[32m+[m[32mgit commit -m "Adicionando 3a linha em script_exemplo"[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32mVocê pode ver o seu histórico de commits clicando no ícone de relógio na aba Git.[m
[32m+[m
[32m+[m[32m## Push[m
[32m+[m
[32m+[m[32mAté agora, você fez os commits para rastrear as alterações que você fez no seu projeto. Porém se você entrar agora na página do repositorio no Github você vai ver que nada mudou. Isso porque você fez tudo localmente. Para fazer o repositorio Git remoto (do Github) ficar igual o seu local (do seu PC), você deve dar um push ( _empurrão_). Você pode apertar a seta **verde** na aba Git ou então dar o comando no terminal:[m
[32m+[m
[32m+[m[32m```{bash}[m
[32m+[m[32mgit push[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32mTrabalhando em equipe, é de bom tom que sempre que você terminar o seu trabalho do dia dê um commit final e um push para que o outro saiba o que fez.[m
[32m+[m
[32m+[m[32mDepois de dado o push, vá na página do seu repositório no Github para conferir se houve modificações. Se deu tudo certo, você deve esperar modificações sim. Repare que na lista dos arquivos, as mensagens do último commit que você deu referente a cada arquivo aparecem do lado destes. Ou seja, do lado de `git_exemplo.Rproj` e `script_exemplo.R` você tem, respectivamente as mensagens "Criando os arquivos iniciais do R após conectar o RStudio com o Github." e "Adicionando terceira linha em script_exemplo". Repare que você pode clicar tanto no arquivo quanto na mensagem do commit (para visualizar o que ocorreu).[m
[32m+[m
[32m+[m[32mNa pagina inicial do repositorio também tem o número de commits que você deu nele que é um link para o seu histórico de commits.[m
[32m+[m
[32m+[m
[32m+[m[32m## Pull[m
[32m+[m
[32m+[m[32mPor se tratar de um repositorio remoto pode ocorrer situações em que você quer igualar o seu repositorio local ao remoto e não o contrario. Motivos para isso podem ser:[m
[32m+[m
[32m+[m[32m - Você trabalhou de outro computador no repositorio remoto e agora o seu repositorio local está defasado frente ao seu trabalho  (que você colocou no repositorio remoto);[m
[32m+[m[41m [m
[32m+[m[32m - Você está trabalhando em equipe e quer atualizar o seu repositorio local com as mudanças feitas pelos seus colegas.[m
[32m+[m
[32m+[m[32mNo caso do segundo, é bom  que sempre que você vá começar uma nova jornada de trabalho você dê um pull (sendo que você deu um commit antes de ir dormir) para trabalhar sobre a versão mais recente do trabalho de todos.[m
[32m+[m
[32m+[m[32mPara dar um pull basta que você aperte a seta azul na aba Git ou dê o seguinte comando no Terminal:[m
[32m+[m
[32m+[m[32m```{bash}[m
[32m+[m[32mgit pull[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32mNo caso do exemplo que estamos dando aqui, vamos receber a resposta de que está tudo atualizado. Para ver como ocorre, crie um arquivo dê o upload num arquivo qualquer no seu repositorio Git. Para tanto basta clicar no botão `Add file` e ou criar um arquivo ou upar um. Com o arquivo adicionado, ao usar o comando `git pull` no terminal aparecerá uma mensagem sumarizando as modificações dos arquivos e quais arquivos novos tem.[m
[32m+[m
[32m+[m[32m## Rotina do Git- sem ramificação (multiplos  _branches_)[m
[32m+[m
[32m+[m[32mAgora você aprendeu os quatro comandos mais básicos e essenciais do git: add, commit, push e pull. Porém, qual é um bom uso que você deve dar a eles na sua rotina do dia a dia? Importante notar que o que está aqui são dicas e não leis sagradas. Não precisa se matar para cumprir tudo a risco. Porém, o hábito faz o monge.[m
[32m+[m
[32m+[m[32mEm primeiro lugar, **procure sempre fazer boas mensagens de commit**. Não precisam ser imensas, mas elas devem servir para identificar mais ou menos o que você estava trabalhando. Bons exemplos de commits podem ser coisas como "corrigindo a leitura da base de dados", "criando funções basicas", "adicionando slides", "corrigindo erros de gramatica" e etc... Mensagens ruins seriam coisas como "mexi em algumas coisas", "aa", "adicionei linhas" e etc... Porém, não se martirize para criar excelentes mensagens. Se não vier, tente escrever sobre algo que você fez e tá valendo.[m
[32m+[m
[32m+[m[32mEm segundo lugar, tente dar commits em blocos que fazem sentido. Ou seja, dê um commit se você revisou uma parte especifica do seu código (como por exemplo a seleção de variáveis). Isso inclusive vai facilitar sua vida na hora de pensar nas mensagens.[m
[32m+[m
[32m+[m[32mEm terceiro lugar, você não precisa por outro lado dar um commit por linha modificada. Existe um meio termo ótimo entre o céu e o inferno.[m
[32m+[m
[32m+[m[32mPor fim, em termos de trabalho individual, é que você não precisa dar um push para cada commit que você fizer. Não deixe de atualizar o seu repositorio remoto sempre que der.[m
[32m+[m
[32m+[m[32m### Quando trabalhando em equipe[m
[32m+[m
[32m+[m[32mSe você estiver trabalhando em equipe as alterações que você e seus colegas fizerem podem sobrepor uma a outra e ser um desastre. Para isso servem múltiplos branches (que falaremos mais a frente), mas algumas boas práticas já ajudam em muitas questões.[m
[32m+[m
[32m+[m[32mQuando estiver trabalhando em equipe no Git (sem branches) é sempre pensar que o repositorio está modificado. Assim, você deve sempre fazer algumas medidas de segurança. A primeira coisa é sempre dar um pull toda vez que começar a trabalhar. **Importante dizer** que isso pressupõe que você colocou no repositorio remoto tudo que você fez no local.[m
[32m+[m
[32m+[m[32mA segunda coisa a se atentar quando estiver trabalhando em equipe é a ordem entre o commit, pull e push. A depender das mudanças que os seus colegas colocaram no repositório, quando você der push, você pode criar uma série de erros. Por outro lado, se você der o Pull inadvertidamente pode perder tudo o que você fez. Por isso é importante que você siga a seguinte ordem ao dar um push:[m
[32m+[m
[32m+[m[32m```{bash}[m
[32m+[m[32mgit Add -A[m
[32m+[m[32mgit commit -m "A mensagem a ser dada"[m
[32m+[m[32mgit pull[m
[32m+[m[32mgit push[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32mSe você deu um commit antes de dar o pull, o seu git irá manter no seu repositorio local as mudanças que você fez ao longo do tempo. E como você vai ter no seu repositorio local todas as modificações que os seus colegas fizeram (por conta do pull), o seu push dificilmente dará erro. Pode no entanto ocorrer, especialmente se você e seu colega estiverem mexendo no mesmo arquivo no mesmo intervalo de tempo.[m
[32m+[m
[32m+[m[32mPara não deixar de falar o óbvio: evite a todo custo mexer ao mesmo tempo e no mesmo arquivo que o seu colega está mexendo.[m
[32m+[m
[32m+[m[32mPor fim, apesar de ser melhor commits facilmente identificados por tópico, sempre dê um commit e um push no fim da sua jornada de trabalho. Seja às 4 da tarde ou as 3 da madrugada, seu colega pode pegar isso no dia seguinte e acabar mexendo num arquivo que você também mexeu no dia anterior, mas como você não deu push, pode dar problema quando os dois derem lá na frente.[m
[32m+[m
[32m+[m[32m## Multiplos Branches[m
[32m+[m
[32m+[m[32mNós acabamos de dar dicas sobre como trabalhar em equipe sem multiplos branches, mas em trabalhos muito grandes e de muitas atividades em paralelo pode ser dificil seguir a risca algumas daquelas práticas. Especialmente em trabalhos que podem envolver mais de 5 pessoas. Por isso, pode ser interessante ramificar o seu repositório. Isso quer dizer criar várias versões dele. Você pode criar um ramo do seu repositorio muito facilmente, basta[m[41m [m
[32m+[m
[32m+[m
[32m+[m[32m```{bash}[m
[32m+[m[32mpush -u origin teste[m
[32m+[m[32m```[m
 [m
 [m
 ## Comandos Git para commit[m
[1mdiff --git a/Topicos Suplementares/Git/intro_git.html b/Topicos Suplementares/Git/intro_git.html[m
[1mindex d32bf8e..f77d82b 100644[m
[1m--- a/Topicos Suplementares/Git/intro_git.html[m	
[1m+++ b/Topicos Suplementares/Git/intro_git.html[m	
[36m@@ -525,7 +525,55 @@[m [mb &lt;- 2 + a</code></pre>[m
 <pre class="r"><code>a &lt;- 2[m
 b &lt;- 2 + a[m
 b-2</code></pre>[m
[31m-<p>Agora, com a mudança sendo percebida pelo Git vamos fazer:</p>[m
[32m+[m[32m<p>Agora, com a mudança sendo percebida pelo Git vá na aba Git, clique em commit e veja como as mudanças são rastreadas pelo Git. Você pode fazer o commit por nessa janela mesmo, ou pode fazer pelo Terminal da seguinte forma:</p>[m
[32m+[m[32m<pre class="bash"><code>git commit -m &quot;Adicionando 3a linha em script_exemplo&quot;</code></pre>[m
[32m+[m[32m<p>Você pode ver o seu histórico de commits clicando no ícone de relógio na aba Git.</p>[m
[32m+[m[32m</div>[m
[32m+[m[32m<div id="push" class="section level2">[m
[32m+[m[32m<h2>Push</h2>[m
[32m+[m[32m<p>Até agora, você fez os commits para rastrear as alterações que você fez no seu projeto. Porém se você entrar agora na página do repositorio no Github você vai ver que nada mudou. Isso porque você fez tudo localmente. Para fazer o repositorio Git remoto (do Github) ficar igual o seu local (do seu PC), você deve dar um push ( <em>empurrão</em>). Você pode apertar a seta <strong>verde</strong> na aba Git ou então dar o comando no terminal:</p>[m
[32m+[m[32m<pre class="bash"><code>git push</code></pre>[m
[32m+[m[32m<p>Trabalhando em equipe, é de bom tom que sempre que você terminar o seu trabalho do dia dê um commit final e um push para que o outro saiba o que fez.</p>[m
[32m+[m[32m<p>Depois de dado o push, vá na página do seu repositório no Github para conferir se houve modificações. Se deu tudo certo, você deve esperar modificações sim. Repare que na lista dos arquivos, as mensagens do último commit que você deu referente a cada arquivo aparecem do lado destes. Ou seja, do lado de <code>git_exemplo.Rproj</code> e <code>script_exemplo.R</code> você tem, respectivamente as mensagens “Criando os arquivos iniciais do R após conectar o RStudio com o Github.” e “Adicionando terceira linha em script_exemplo”. Repare que você pode clicar tanto no arquivo quanto na mensagem do commit (para visualizar o que ocorreu).</p>[m
[32m+[m[32m<p>Na pagina inicial do repositorio também tem o número de commits que você deu nele que é um link para o seu histórico de commits.</p>[m
[32m+[m[32m</div>[m
[32m+[m[32m<div id="pull" class="section level2">[m
[32m+[m[32m<h2>Pull</h2>[m
[32m+[m[32m<p>Por se tratar de um repositorio remoto pode ocorrer situações em que você quer igualar o seu repositorio local ao remoto e não o contrario. Motivos para isso podem ser:</p>[m
[32m+[m[32m<ul>[m
[32m+[m[32m<li><p>Você trabalhou de outro computador no repositorio remoto e agora o seu repositorio local está defasado frente ao seu trabalho (que você colocou no repositorio remoto);</p></li>[m
[32m+[m[32m<li><p>Você está trabalhando em equipe e quer atualizar o seu repositorio local com as mudanças feitas pelos seus colegas.</p></li>[m
[32m+[m[32m</ul>[m
[32m+[m[32m<p>No caso do segundo, é bom que sempre que você vá começar uma nova jornada de trabalho você dê um pull (sendo que você deu um commit antes de ir dormir) para trabalhar sobre a versão mais recente do trabalho de todos.</p>[m
[32m+[m[32m<p>Para dar um pull basta que você aperte a seta azul na aba Git ou dê o seguinte comando no Terminal:</p>[m
[32m+[m[32m<pre class="bash"><code>git pull</code></pre>[m
[32m+[m[32m<p>No caso do exemplo que estamos dando aqui, vamos receber a resposta de que está tudo atualizado. Para ver como ocorre, crie um arquivo dê o upload num arquivo qualquer no seu repositorio Git. Para tanto basta clicar no botão <code>Add file</code> e ou criar um arquivo ou upar um. Com o arquivo adicionado, ao usar o comando <code>git pull</code> no terminal aparecerá uma mensagem sumarizando as modificações dos arquivos e quais arquivos novos tem.</p>[m
[32m+[m[32m</div>[m
[32m+[m[32m<div id="rotina-do-git--sem-ramificação-multiplos-branches" class="section level2">[m
[32m+[m[32m<h2>Rotina do Git- sem ramificação (multiplos <em>branches</em>)</h2>[m
[32m+[m[32m<p>Agora você aprendeu os quatro comandos mais básicos e essenciais do git: add, commit, push e pull. Porém, qual é um bom uso que você deve dar a eles na sua rotina do dia a dia? Importante notar que o que está aqui são dicas e não leis sagradas. Não precisa se matar para cumprir tudo a risco. Porém, o hábito faz o monge.</p>[m
[32m+[m[32m<p>Em primeiro lugar, <strong>procure sempre fazer boas mensagens de commit</strong>. Não precisam ser imensas, mas elas devem servir para identificar mais ou menos o que você estava trabalhando. Bons exemplos de commits podem ser coisas como “corrigindo a leitura da base de dados”, “criando funções basicas”, “adicionando slides”, “corrigindo erros de gramatica” e etc… Mensagens ruins seriam coisas como “mexi em algumas coisas”, “aa”, “adicionei linhas” e etc… Porém, não se martirize para criar excelentes mensagens. Se não vier, tente escrever sobre algo que você fez e tá valendo.</p>[m
[32m+[m[32m<p>Em segundo lugar, tente dar commits em blocos que fazem sentido. Ou seja, dê um commit se você revisou uma parte especifica do seu código (como por exemplo a seleção de variáveis). Isso inclusive vai facilitar sua vida na hora de pensar nas mensagens.</p>[m
[32m+[m[32m<p>Em terceiro lugar, você não precisa por outro lado dar um commit por linha modificada. Existe um meio termo ótimo entre o céu e o inferno.</p>[m
[32m+[m[32m<p>Por fim, em termos de trabalho individual, é que você não precisa dar um push para cada commit que você fizer. Não deixe de atualizar o seu repositorio remoto sempre que der.</p>[m
[32m+[m[32m<div id="quando-trabalhando-em-equipe" class="section level3">[m
[32m+[m[32m<h3>Quando trabalhando em equipe</h3>[m
[32m+[m[32m<p>Se você estiver trabalhando em equipe as alterações que você e seus colegas fizerem podem sobrepor uma a outra e ser um desastre. Para isso servem múltiplos branches (que falaremos mais a frente), mas algumas boas práticas já ajudam em muitas questões.</p>[m
[32m+[m[32m<p>Quando estiver trabalhando em equipe no Git (sem branches) é sempre pensar que o repositorio está modificado. Assim, você deve sempre fazer algumas medidas de segurança. A primeira coisa é sempre dar um pull toda vez que começar a trabalhar. <strong>Importante dizer</strong> que isso pressupõe que você colocou no repositorio remoto tudo que você fez no local.</p>[m
[32m+[m[32m<p>A segunda coisa a se atentar quando estiver trabalhando em equipe é a ordem entre o commit, pull e push. A depender das mudanças que os seus colegas colocaram no repositório, quando você der push, você pode criar uma série de erros. Por outro lado, se você der o Pull inadvertidamente pode perder tudo o que você fez. Por isso é importante que você siga a seguinte ordem ao dar um push:</p>[m
[32m+[m[32m<pre class="bash"><code>git Add -A[m
[32m+[m[32mgit commit -m &quot;A mensagem a ser dada&quot;[m
[32m+[m[32mgit pull[m
[32m+[m[32mgit push</code></pre>[m
[32m+[m[32m<p>Se você deu um commit antes de dar o pull, o seu git irá manter no seu repositorio local as mudanças que você fez ao longo do tempo. E como você vai ter no seu repositorio local todas as modificações que os seus colegas fizeram (por conta do pull), o seu push dificilmente dará erro. Pode no entanto ocorrer, especialmente se você e seu colega estiverem mexendo no mesmo arquivo no mesmo intervalo de tempo.</p>[m
[32m+[m[32m<p>Para não deixar de falar o óbvio: evite a todo custo mexer ao mesmo tempo e no mesmo arquivo que o seu colega está mexendo.</p>[m
[32m+[m[32m<p>Por fim, apesar de ser melhor commits facilmente identificados por tópico, sempre dê um commit e um push no fim da sua jornada de trabalho. Seja às 4 da tarde ou as 3 da madrugada, seu colega pode pegar isso no dia seguinte e acabar mexendo num arquivo que você também mexeu no dia anterior, mas como você não deu push, pode dar problema quando os dois derem lá na frente.</p>[m
[32m+[m[32m</div>[m
[32m+[m[32m</div>[m
[32m+[m[32m<div id="multiplos-branches" class="section level2">[m
[32m+[m[32m<h2>Multiplos Branches</h2>[m
[32m+[m[32m<p>Nós acabamos de dar dicas sobre como trabalhar em equipe sem multiplos branches, mas em trabalhos muito grandes e de muitas atividades em paralelo pode ser dificil seguir a risca algumas daquelas práticas. Especialmente em trabalhos que podem envolver mais de 5 pessoas. Por isso, pode ser interessante ramificar o seu repositório. Isso quer dizer criar várias versões dele. Você pode criar um ramo do seu repositorio muito facilmente, basta</p>[m
[32m+[m[32m<pre class="bash"><code>push -u origin teste</code></pre>[m
 </div>[m
 <div id="comandos-git-para-commit" class="section level2">[m
 <h2>Comandos Git para commit</h2>[m
