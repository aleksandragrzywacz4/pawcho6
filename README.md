Laboratorium 6
Aleksandra Grzywacz

1. Utworzenie publicznego repozytorium
   
gh repo create pawcho6 --public --source=. --remote=origin --push

2. Treść pliku Dockerfile
   <img width="848" height="935" alt="image" src="https://github.com/user-attachments/assets/7fe60a9c-2623-45d8-8de3-590947f0557f" />



3. Budowa obrazu i publikacja

-rejestracja klucza w agencie SSH

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

-budowa obrazu z flagą SSH

docker buildx build --build-arg VERSION="lab6-v1"   --ssh s56git=$HOME/.ssh/id_ed25519   --progress=plain   -t ghcr.io/aleksandragrzywacz4/pawcho6:lab6 --load .


<img width="1102" height="932" alt="image" src="https://github.com/user-attachments/assets/6360c328-0d7e-4ebd-9583-59b28b42641d" />

-publikacja obrazu

docker push ghcr.io/aleksandragrzywacz4/pawcho6:lab6


Zmieniłam widoczność Package na Public i połączyłam z repozytorium pawcho6

<img width="1627" height="617" alt="image" src="https://github.com/user-attachments/assets/9b226497-5c81-44bf-aea1-14f4fcea4f92" />

4. Wynik działania
<img width="1504" height="155" alt="image" src="https://github.com/user-attachments/assets/e2416dbe-7d73-4b98-9bc1-8d1274243a5f" />

<img width="578" height="301" alt="image" src="https://github.com/user-attachments/assets/7126b035-f6ab-475c-a8df-f64c29444255" />

