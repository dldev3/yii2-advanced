<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "branches".
 *
 * @property int $branch_id
 * @property int $companies_company_id
 * @property string $branch_name
 * @property string $branch_address
 * @property string $branch_created_date
 * @property string $branch_status
 *
 * @property Departments $branch
 * @property Companies $companies
 * @property Departments[] $companies0
 */
class Branches extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'branches';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['companies_company_id', 'branch_name', 'branch_address', 'branch_status'], 'required'],
            [['companies_company_id'], 'integer'],
            [['branch_address', 'branch_status'], 'string'],
            [['branch_created_date'], 'safe'],
            [['branch_name'], 'string', 'max' => 100],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Departments::className(), 'targetAttribute' => ['branch_id' => 'branches_branch_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'branch_id' => 'Branch ID',
            'companies_company_id' => 'Companies Company ID',
            'branch_name' => 'Branch Name',
            'branch_address' => 'Branch Address',
            'branch_created_date' => 'Branch Created Date',
            'branch_status' => 'Branch Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranch()
    {
        return $this->hasOne(Departments::className(), ['branches_branch_id' => 'branch_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanies()
    {
        return $this->hasOne(Companies::className(), ['company_id' => 'companies_company_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanies0()
    {
        return $this->hasMany(Departments::className(), ['companies_company_id' => 'company_id'])->viaTable('companies', ['company_id' => 'companies_company_id']);
    }
}
