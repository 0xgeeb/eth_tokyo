# Celo Proof of Participation

Dynamic NFT that showcases how much a user has participated on Celo

This project consists of a NFT contract and a front-end to mint the NFT. The contract searches the celo blockchain to find which protocols or apps the user has interacted with gauge their participation level in celo. Depending on that participation level, the user will receive a Bronze, Silver, or Gold tier NFT.

This project uses various NFT token URIs to display a different image for the amount of participation the user has on Celo. The contract calls out to various contracts on the Celo blockchain to find the msg.sender's balances of prominent protocol's tokens on Celo. Foundry was the framework used to write, test, and deploy the contract. The front-end for this project was built using Nextjs, Vercel, Wagmi, and RainbowKit.
