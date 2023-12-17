/**
* The Forgotten Server D - This file doesn't belong to theforgottenserver developers.
*/

#include "otpch.h"

#include "rewardchest.h"

RewardChest::RewardChest(uint16_t type) :
	Container(type)
{
	maxSize = 32;
	unlocked = false;
}

ReturnValue RewardChest::queryAdd(int32_t, const Thing&, uint32_t,
	uint32_t, Creature* actor/* = nullptr*/) const
{
	if (actor) {
		return RETURNVALUE_NOTPOSSIBLE;
	}
		
	return RETURNVALUE_NOERROR;
}

void RewardChest::postAddNotification(Thing* thing, const Cylinder* oldParent, int32_t index, cylinderlink_t)
{
	if (parent != nullptr) {
		parent->postAddNotification(thing, oldParent, index, LINK_PARENT);
	}
}

void RewardChest::postRemoveNotification(Thing* thing, const Cylinder* newParent, int32_t index, cylinderlink_t)
{
	if (parent != nullptr) {
		parent->postRemoveNotification(thing, newParent, index, LINK_PARENT);
	}
}
