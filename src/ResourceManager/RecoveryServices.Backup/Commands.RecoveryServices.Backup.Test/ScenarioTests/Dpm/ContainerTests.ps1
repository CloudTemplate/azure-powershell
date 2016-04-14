﻿# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

function Test-GetContainerScenario
{
	$vault = Get-AzureRmRecoveryServicesVault -ResourceGroupName "RsvTestRG" -Name "RsvTestRN";
	Set-AzureRmRecoveryServicesVaultContext -Vault $vault;
	$containers = Get-AzureRmRecoveryServicesBackupManagementServer;	

	$namedContainer = Get-AzureRmRecoveryServicesBackupManagementServer -Name "NAGAASTHRAM.DPMDOM02.SELFHOST.CORP.MICROSOFT.COM";
	Assert-AreEqual $namedContainer.FriendlyName "NAGAASTHRAM.DPMDOM02.SELFHOST.CORP.MICROSOFT.COM";
}

function Test-UnregisterContainerScenario
{
	$vault = Get-AzureRmRecoveryServicesVault -ResourceGroupName "RsvTestRG" -Name "RsvTestRN";
	Set-AzureRmRecoveryServicesVaultContext -Vault $vault;
	
	$container = Get-AzureRmRecoveryServicesBackupManagementServer -Name "NAGAASTHRAM.DPMDOM02.SELFHOST.CORP.MICROSOFT.COM";
	Assert-AreEqual $container.FriendlyName "NAGAASTHRAM.DPMDOM02.SELFHOST.CORP.MICROSOFT.COM";

	Unregister-AzureRmRecoveryServicesBackupContainer -AzureRmBackupManagementServer $container;
	$contianer = Get-AzureRmRecoveryServicesBackupManagementServer -Name "NAGAASTHRAM.DPMDOM02.SELFHOST.CORP.MICROSOFT.COM";
	Assert-Null $container;
}