Laboratorium 6
Aleksandra Grzywacz

1. Utworzenie publicznego repozytorium
   
gh repo create pawcho6 --public --source=. --remote=origin --push

2. Treść pliku Dockerfile
   <img width="824" height="721" alt="image" src="https://github.com/user-attachments/assets/29d0ebab-66b1-4027-8156-64c4369a76f4" />

3. Budowa obrazu i publikacja

-rejestracja klucza w agencie SSH

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

-budowa obrazu z flagą SSH

docker build --ssh default --build-arg VERSION="lab6-v1" -t ghcr.io/aleksandragrzywacz4/pawcho6:lab6 .

-publikacja obrazu

docker push ghcr.io/aleksandragrzywacz4/pawcho6:lab6

<img width="1047" height="403" alt="image" src="https://github.com/user-attachments/assets/3f19d50f-c4bf-4a23-94bf-e0c96f50fdcd" />

Zmieniłam widoczność Package na Public i połączyłam z repozytorium pawcho6

<img width="1627" height="617" alt="image" src="https://github.com/user-attachments/assets/9b226497-5c81-44bf-aea1-14f4fcea4f92" />

4. Wynik działania
<img width="1222" height="99" alt="image" src="https://github.com/user-attachments/assets/9190dd01-11b0-426c-ab56-b5a0b1651be5" />

<img width="1365" height="124" alt="image" src="https://github.com/user-attachments/assets/950cfb5e-0be5-4dd3-a1e6-27d41ebc7519" />

