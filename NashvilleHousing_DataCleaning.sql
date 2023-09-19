SELECT *
FROM PortfolioProject..NashvilleHousing
--WHERE LegalReference = '20150219-0014347' --to check duplicate rows with different uniqueID 



--Change Date Format and Add one new column for Date Updated
SELECT SaleDate, CONVERT(Date,SaleDate) SaleDate_Fixed
FROM PortfolioProject..NashvilleHousing

ALTER TABLE NashvilleHousing
ADD SaleDate_Fixed Date

UPDATE PortfolioProject..NashvilleHousing
SET SaleDate_Fixed = CONVERT(Date,SaleDate)




-- Fill up same PropertyAddress for different uniqueID with same other info

SELECT a.UniqueID, a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress) PropertyAddress
FROM PortfolioProject..NashvilleHousing a
JOIN PortfolioProject..NashvilleHousing b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ]<>b.[UniqueID ]
WHERE a.PropertyAddress is NULL

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM PortfolioProject..NashvilleHousing a
JOIN PortfolioProject..NashvilleHousing b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ]<>b.[UniqueID ]
WHERE a.PropertyAddress is NULL





-- Split PropertyAddress to Address and City with SUBSTRING Function

SELECT  PropertyAddress, SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1) Split_PropertyAddress,
SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1 , LEN(PropertyAddress)) Split_PropertyCity
FROM PortfolioProject..NashvilleHousing


ALTER TABLE NashvilleHousing
ADD Split_PropertyAddress Nvarchar(255)

UPDATE NashvilleHousing
SET Split_PropertyAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1)
FROM PortfolioProject..NashvilleHousing

ALTER TABLE NashvilleHousing
ADD Split_PropertyCity Nvarchar(255)

UPDATE NashvilleHousing
SET Split_PropertyCity = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1 , LEN(PropertyAddress))
FROM PortfolioProject..NashvilleHousing

--Split PropertyAddress to Address and City with PARSENAME Function
SELECT  PropertyAddress, PARSENAME(REPLACE(PropertyAddress, ',', '.'),2)
FROM PortfolioProject..NashvilleHousing





-- Split OwnerAddress to Address and City with PARSENAME Function

SELECT OwnerAddress, 
	   PARSENAME(REPLACE(OwnerAddress,',','.'),3) Owner_Address,
	   PARSENAME(REPLACE(OwnerAddress,',','.'),2) Owner_City,
	   PARSENAME(REPLACE(OwnerAddress,',','.'),1) Owner_State
FROM PortfolioProject..NashvilleHousing

ALTER TABLE NashvilleHousing
ADD Owner_Address Nvarchar(255)

UPDATE NashvilleHousing
SET Owner_Address = PARSENAME(REPLACE(OwnerAddress,',','.'),3)
FROM PortfolioProject..NashvilleHousing

ALTER TABLE NashvilleHousing
ADD Owner_City Nvarchar(255)

UPDATE NashvilleHousing
SET Owner_City = PARSENAME(REPLACE(OwnerAddress,',','.'),2)
FROM PortfolioProject..NashvilleHousing

ALTER TABLE NashvilleHousing
ADD Owner_State Nvarchar(255)

UPDATE NashvilleHousing
SET Owner_State = PARSENAME(REPLACE(OwnerAddress,',','.'),1)
FROM PortfolioProject..NashvilleHousing





--- Modify SoldAsVacant to Yes and No only (update N to No and Y to Yes)

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM PortfolioProject..NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2

SELECT SoldAsVacant,
		CASE 
		WHEN SoldAsVacant = 'N' THEN 'No'
		WHEN SoldAsVacant = 'Y' THEN 'Yes'
		ELSE SoldAsVacant 
		END
FROM PortfolioProject..NashvilleHousing

UPDATE NashvilleHousing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'N' THEN 'No'
						WHEN SoldAsVacant = 'Y' THEN 'Yes'
						ELSE SoldAsVacant 
					END


--Remove Duplicate Rows

WITH Duplicate AS(
SELECT *,
 ROW_NUMBER() OVER(
	PARTITION BY ParcelID, 
				 PropertyAddress, 
				 SaleDate, 
				 SalePrice, 
				 LegalReference
				 ORDER BY 
				 UniqueID
				 )row_duplicate
FROM PortfolioProject..NashvilleHousing
)
SELECT * --DELETE and check with SELECT * again
FROM Duplicate
WHERE row_duplicate > 1





--DELETE unnessary columns
SELECT *
FROM PortfolioProject..NashvilleHousing

ALTER TABLE PortfolioProject..NashvilleHousing
DROP COLUMN PropertyAddress, SaleDate, OwnerAddress, TaxDistrict