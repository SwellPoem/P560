%% setup
mdl_puma560
load hershey

%% setup
str = "gatto"; %stringa da scrivere
chr = convertStringsToChars(str); %converto la stringa in caratteri
                                  %per poterli prendere singolarmente

syms P tmp k; %variabili di appoggio

%% For per generare il path della lettera
for i=1:length(chr)
    tmp = chr(i); %assegno a tmp il carattere su cui sto ciclando
    tmp = hershey{chr(i)};
    tmp.stroke; %dimensioni del carattere 
    
    %creo degli array di appoggio
    %A ha le dimensioni della lettera su cui ciclo
    %B, C e D servono per aggiungere una riga all array.
    %A ha infatti dimensioni 2xI, per creare il path è necessario sia di
    %dimensioni 3xI.
    A = zeros(numrows(tmp.stroke), numcols(tmp.stroke));
    B = reshape(A', [numcols(tmp.stroke) numrows(tmp.stroke)]);
    C = [B zeros(numcols(tmp.stroke), 1)];
    D = reshape(C, [numcols(tmp.stroke), 3])';
    
    %Una volta raggiunte le dimensioni necessarie creo un array di celle
    path{i} = {D};
    
    %creo il path con le dimensioni del carattere che ho caricato
    %precedentemente e aggiungo una colonna di zeri per la variabile z
    path{i} = [0.35*tmp.stroke; zeros(1, numcols(tmp.stroke))];
    k = find(isnan(path{i}(1,:))); %identifico le colonne nulle
    path{i}(:,k) = path{i}(:,k-1); %e le sostituisco con una copia della colonna precedente
    path{i}(3,k) = 0.3 %e a queste particolari colonne copia assegno un valore della z
                       %in modo tale che il robot sollevi la penna
    
end

%% trajectory
syms P; %variabile di appoggio
%for j=1:length(chr)-1
    %creo un unico path per tutte le lettere della parola unendo i diversi
    %path creati con il for precedente.
    P = [path{1} [0.2; 0; 0]+path{2} [0.4; 0; 0]+path{3} [0.6; 0; 0]+path{4} [0.8; 0; 0]+path{5}];
    
%end

%creo una traiettoria che il manipolatore potrà seguire
%e chiamo la funzione 'ikine6s' per effettuare le operazioni di inversione
%cinematica per ogni punto della traiettoria.

traj = mstraj(P(:,2:end)', [2 2 2], [], P(:,1)', 0.02, 0.2);
Tp = SE3(-0.6, 0.2, 0) * SE3(traj) * SE3.oa( [0 0 1], [-1 0 0]);
q = p560.ikine6s(Tp);

%time= (numrows(traj)+numrows(traj2)+numrows(traj3)+numrows(traj4)+numrows(traj5)+numrows(traj6))*0.02

%% plot
%plot finale della scritta e successiva visualizzazione del movimento del
%braccio robotico.
plot3(-0.6+traj(:,1), 0.2+traj(:,2), traj(:,3), 'linewidth', 2, 'color', 'b');
hold on;
grid;
p560.plot(q)