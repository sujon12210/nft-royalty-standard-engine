# NFT Royalty Standard Engine

An expert-level NFT boilerplate using the **ERC-721A** standard by Azuki, which significantly reduces gas costs for users minting multiple NFTs in a single transaction.

### Features
* **ERC-721A:** Industry-leading gas efficiency for batch minting.
* **EIP-2981:** Native royalty support compatible with OpenSea, Rarible, and LooksRare.
* **Metadata Management:** Simple baseURI pattern for IPFS integration.
* **Security:** Access control for withdrawals and contract settings.

### Deployment
1. Install: `npm install`
2. Configure: Set your `baseURI` in the `Collection.sol`.
3. Deploy: `npx hardhat run deploy.js --network goerli`
