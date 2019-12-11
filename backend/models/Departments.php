<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "departments".
 *
 * @property int $department_id
 * @property int $branches_branch_id
 * @property string $department_name
 * @property int $companies_company_id
 * @property string $department_created_date
 * @property string $department_status
 *
 * @property Branches $branches
 * @property Companies $companies
 * @property Branches[] $companies0
 */
class Departments extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'departments';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['branches_branch_id', 'department_name', 'companies_company_id', 'department_status'], 'required'],
            [['branches_branch_id', 'companies_company_id'], 'integer'],
            [['department_created_date'], 'safe'],
            [['department_status'], 'string'],
            [['department_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'department_id' => 'Department ID',
            'branches_branch_id' => 'Branches Branch ID',
            'department_name' => 'Department Name',
            'companies_company_id' => 'Companies Company ID',
            'department_created_date' => 'Department Created Date',
            'department_status' => 'Department Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranches()
    {
        return $this->hasOne(Branches::className(), ['branch_id' => 'branches_branch_id']);
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
        return $this->hasMany(Branches::className(), ['companies_company_id' => 'company_id'])->viaTable('companies', ['company_id' => 'companies_company_id']);
    }
}
