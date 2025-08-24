---@alias TalismanNumber number|table
---@alias fn<T> fun(...): T

-- Cache the function for performance and stuffs.
---@type fn<any>, fn<number>, fn<any>
local to_big, to_number, lenient_bignum = to_big, to_number, lenient_bignum

-- Ensure the Number table exists.
if not Number then
	Number = {}
end

---Positive Infinity value.
---@type number
Number.Inf = 1 / 0
---Negative Infinity value.
---@type number
Number.NegInf = -Number.Inf

---Return the largest integer that is smaller than the given number.
---@param n TalismanNumber
---@return TalismanNumber
function Number.floor(n)
	if type(n) == "number" then
		return math.floor(n)
	end

	return n:floor()
end

---Return the smallest integer that is bigger than the given number.
---@param n TalismanNumber
---@return TalismanNumber?
function Number.ceil(n)
	if type(n) == "number" then
		return math.ceil(n)
	end

	return n:ceil()
end

---Add two given numbers.
---@param a TalismanNumber
---@param b TalismanNumber
---@return TalismanNumber
function Number.add(a, b)
	return a + b
end

---Substract two given numbers.
---@param a TalismanNumber
---@param b TalismanNumber
---@return TalismanNumber
function Number.sub(a, b)
	return a - b
end

---Multiply two given numbers.
---@param a TalismanNumber
---@param b TalismanNumber
---@return TalismanNumber
function Number.mul(a, b)
	return a * b
end

---Divide two given numbers.
---@param a TalismanNumber
---@param b TalismanNumber
---@return TalismanNumber
function Number.div(a, b)
	return a / b
end

---Convert the given number into an instance of BigNum/OmegaNum.
---@param n TalismanNumber
---@return TalismanNumber
function Number.toBig(n)
	return to_big(n)
end

---Convert the given number into a Lua number.
---@param n TalismanNumber
---@return number
function Number.toNumber(n)
	return to_number(n)
end

---Convert the given number into a number.
---@param n TalismanNumber
---@return number
function Number.lenientBignum(n)
	return lenient_bignum(n)
end

---Exponentiate two given numbers.
---@param a TalismanNumber
---@param b TalismanNumber
---@return TalismanNumber
function Number.exp(a, b)
	return Number.toBig(a):pow(b)
end

---Tetrate two given numbers.
---@param a TalismanNumber
---@param b TalismanNumber
---@return TalismanNumber
function Number.tetrate(a, b)
	return Number.toBig(a):tetrate(b)
end

---Perform a hyperoperation on two given numbers.
---@param a TalismanNumber
---@param b TalismanNumber
---@param arrows number
---@return TalismanNumber
function Number.hyper(a, b, arrows)
	return Number.toBig(a):arrow(arrows, b)
end

---Checks if the given number is NaN.
---@param n TalismanNumber
---@return boolean
function Number.isNaN(n)
	if type(n) == "number" then
		return n ~= n
	end

	return n:isNaN()
end

---Returns the smaller value of two supplied numbers.
---@param a TalismanNumber
---@param b TalismanNumber
---@return TalismanNumber
function Number.min(a, b)
	if type(a) == "number" and type(b) == "number" then
		return math.min(a, b)
	end

	return Number.toBig(a):min(b)
end

---Returns the bigger value of two supplied numbers.
---@param a TalismanNumber
---@param b TalismanNumber
---@return TalismanNumber
function Number.max(a, b)
	if type(a) == "number" and type(b) == "number" then
		return math.max(a, b)
	end

	return Number.toBig(a):max(b)
end
