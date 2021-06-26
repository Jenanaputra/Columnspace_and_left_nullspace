% Matrix_awal
% A=   [1 2 1 1 5
%      -2 -4 0 4 -2
%       1 2 2 4 9 ]

A=[1 -2 1; 2 -4 2; 1 0 2; 1 4 4; 5 -2 9];
% A=[1 2 4; 0 0 0; 0 3 6];
BB=A;
B=5; K=3;
% B=3; K=3;
for D=1 : K
   for E=1 : B
       if A(1,1)~=0
          if(D+E)<=B
              if A((D+E),D)~=0
                    r= A((D+E),D)/A(D,D);
                        if A(D,D)~=0
                                for Z=1:K
                                     A((D+E),Z)=A((D+E),Z)-(r*A(D,Z));
                                end
                        else
                                for Z=1:K
                                     A((D+E),Z)=A((D+E),Z);
                                end
                        end
              else 
                        C=1;
                        while A((D+E),(D+C))~=0
                            for C= 1 : (K-D)
                                r= A((D+E),(D+C))/A((D),(D+C));
                                     for Z=1:K
                                        A((D+E),Z)=A((D+E),Z)-(r*A(D,Z));
                                     end
                            end
                        end
              end
          end
       end
   end
end
%----------------------------- Penentuan nilai rank-----------------------
counter=0;
Inverse_rank=0;
for U=1: B
    for L=1 : K
        if A(U,L) == 0
            counter=counter+1;
        end

    end
             if (counter/K)==1
                Inverse_rank=Inverse_rank+1;
             end
    counter=0;
end
rank=B-Inverse_rank;
%----------------------------- Penentuan column space ------------------
BE=zeros(rank,K); 
counter1=0;
UU=0;
for U1=1: B
    for L1=1 : K
        if A(U1,L1) ~= 0
            counter1=counter1+1;
        end
    end
             if ((counter1)/K) > 0.00
                UU=UU+1;
                for Z= 1 : K
                BE(UU,Z)=BB(U1,Z);
                end
             end
    counter1=0;
end
Basic=BE';
Column_Space=Basic;
Matrix_Baru=A;
%----------------------- Left Null Space------------------
counter3=0;
for U2 = 1 : B
    for L2 = 1 : K
       if (Matrix_Baru(U2,L2)~= 0)
           counter3=counter3+1;
           
           if (counter3/1) == 1
               if (Matrix_Baru(U2,L2)~= 1)
                   OKE=Matrix_Baru(U2,L2);
                   for ZZ= 0 : (K-L2)
                        Matrix_Baru(U2,L2+ZZ)= Matrix_Baru(U2,L2+ZZ)/ OKE; 
                   end
               end
               if (L2+1)<= K
                   for ZE= L2 : K
                       if (ZE+1) <= K
                        Matrix_Baru(U2,ZE+1)=-1*Matrix_Baru(U2,ZE+1);
                       end
                   end
               end
           end
           
       end
    end
    counter3=0;
end
%OKE1=0;
counter3=0;
for U2 = 1 : K
    for L2 = 1 : B
       if (Matrix_Baru(L2,U2)~= 0)
           counter3=counter3+1;
       end
           
           if (counter3)==2
               counter1=counter1+1;
               if counter1==1
                    for UU=1:K
                        if (U2+UU)<=K
                            Matrix_Baru(1,(U2+UU))=(Matrix_Baru(1,U2)*Matrix_Baru(L2,(U2+UU)))+(Matrix_Baru(1,(U2+UU)));
                        end
                    end
                    Matrix_Baru(1,U2)=0;
               end
           end           
    end
    counter3=0;
end
%--------------------------------------------Done---------------------------------------------
counter1=0;
Matrix_Baru1=Matrix_Baru;
Baru=zeros(K,K);
for T = 1 : B
    for Y = 1 : K
        if Matrix_Baru1(T,Y) ~= 0
            counter1=counter1+1;
        end
            if (counter1/1==1)
                for zx=1 : K
                    if (zx+Y)<= K
                        if Matrix_Baru1(T,(Y+zx))~=0
                        Baru(Y,(Y+zx))=Matrix_Baru1(T,(Y+zx));
                        end
                    end    
                end
            end
    end
    counter1=0;
end
counterx=0;
for T = 1 : K
    for Y = 1 : K
        if(Baru(T,Y))~=0
            counter1=counter1+1;
            if(counter1==1)
                 for T = 1 : K
                     for Y = 1 : K
                         if Baru(Y,T) ~= 0
                             counterx=counterx+1;
                             if counterx ~= 0
                                 Baru(T,T)=1;
                             end
                         end
                     end
                     counterx=0;
                 end
            end
        end
    end
    counter1=0;
end
counter2=0;
Baru1=Baru;
for O = 1 : K
   for P = 1 : K
       if ((O-counter2))>0
       if (Baru1(P,O-counter2)) == 0
           counter1=counter1+1;
       end
            if (counter1==K)
                counter2=counter2+1;
                Baru1(:,((O-counter2)+1))=[];
                end
            end
   end
    counter1=0;
   end
Left_Null_Space=Baru1
Column_Space
