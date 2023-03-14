import { expect } from "chai";
import { ethers } from "hardhat";

describe("Counter", function () {
    it("Counter test", async function() {
        const Counter = await ethers.getContractFactory("Counter");
        const counter = await Counter.deploy();
        await counter.deployed();

        console.log ("counter address: " + counter.address);

        expect(await counter.count()).to.equal(0);

        await counter.add(99);

        expect(await counter.count()).to.equal(99);
    });
});