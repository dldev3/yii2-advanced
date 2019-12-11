<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "companies".
 *
 * @property int $company_id
 * @property string $company_name
 * @property string $company_email
 * @property string $company_address
 * @property string $company_created_date
 * @property string $company_status
 *
 * @property Branches $company
 * @property Departments $company0
 */
class Companies extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'companies';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['company_name', 'company_email', 'company_address', 'company_status'], 'required'],
            [['company_address', 'company_status'], 'string'],
            [['company_created_date'], 'safe'],
            [['company_name', 'company_email'], 'string', 'max' => 255],
            [['company_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branches::className(), 'targetAttribute' => ['company_id' => 'companies_company_id']],
            [['company_id'], 'exist', 'skipOnError' => true, 'targetClass' => Departments::className(), 'targetAttribute' => ['company_id' => 'companies_company_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'company_id' => 'Company ID',
            'company_name' => 'Company Name',
            'company_email' => 'Company Email',
            'company_address' => 'Company Address',
            'company_created_date' => 'Company Created Date',
            'company_status' => 'Company Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompany()
    {
        return $this->hasOne(Branches::className(), ['companies_company_id' => 'company_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompany0()
    {
        return $this->hasOne(Departments::className(), ['companies_company_id' => 'company_id']);
    }
}
