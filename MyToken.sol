// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title MyToken — A simple ERC-20 token for learning
/// @author Your Name
/// @notice Implements the core ERC-20 interface: transfer, approve, transferFrom, allowance, balanceOf, events
contract MyToken {
    // --- Token metadata (public getters are created automatically) ---
    string public name;        // e.g. "MyToken"
    string public symbol;      // e.g. "MTK"
    uint8 public decimals;     // typically 18

    // --- ERC-20 storage ---
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    // allowance[owner][spender] = amount
    mapping(address => mapping(address => uint256)) public allowance;

    // --- Events (ERC-20 standard) ---
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /// @notice Constructor — set metadata and mint entire supply to deployer
    /// @param _name Token name
    /// @param _symbol Token symbol
    /// @param _decimals Number of decimals (usually 18)
    /// @param _initialSupply The initial total supply expressed in the smallest units
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply
    ) {
        require(_initialSupply > 0, "Initial supply must be > 0");

        name = _name;
        symbol = _symbol;
        decimals = _decimals;

        totalSupply = _initialSupply;
        balanceOf[msg.sender] = _initialSupply;

        // Emit Transfer from zero address to indicate minting per ERC-20 convention
        emit Transfer(address(0), msg.sender, _initialSupply);
    }

    /// @notice Transfer `_value` tokens from caller to `_to`
    /// @param _to recipient address
    /// @param _value amount to transfer (in smallest unit)
    /// @return success true if transfer succeeds
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // Update balances
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    /// @notice Approve `_spender` to spend `_value` on caller's behalf
    /// @param _spender address allowed to spend
    /// @param _value allowance amount
    /// @return success true if approve succeeds
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "Cannot approve zero address");

        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /// @notice Transfer `_value` tokens from `_from` to `_to` using allowance mechanism
    /// @param _from owner address
    /// @param _to recipient address
    /// @param _value amount to transfer
    /// @return success true if transferFrom succeeds
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        // Update balances first (checks-effects-interactions)
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // Decrease allowance
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

    
    function getTokenInfo() external view returns (string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) {
        return (name, symbol, decimals, totalSupply);
    }
}
